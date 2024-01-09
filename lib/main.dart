import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shoort/core/prefrences/appuser.dart';
import 'package:shoort/routes/app_pages.dart';
import 'package:shoort/core/base_package.dart';
import 'package:responsive_framework/responsive_framework.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: const FirebaseOptions(
    apiKey: "AIzaSyApA_wjtwkCrK1UuXkXxWSR1Yia8WTfgL8",
  authDomain: "shoort-2d60f.firebaseapp.com",
  projectId: "shoort-2d60f",
  
  storageBucket: "shoort-2d60f.appspot.com",
  messagingSenderId: "596765915594",
  appId: "1:596765915594:web:b6d69d88291b57777b3733",
  measurementId: "G-2FYM325KQ0"
  )

  );
  


  // initialize hive
  try {await Hive.initFlutter();
  Hive.registerAdapter(AppUserAdapter());
  await Hive.openBox<AppUser>(Constants.shoortBox);
  
  }

  catch(e){

    debugPrint(e.toString());
  }


  ///open hive box

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            theme: ThemeData(
              primaryColor: Color(ColorsTheme.primaryBlack),
            ),
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            getPages: AppPages.list,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 200),
            title: 'Flutter Demo',
                        );
        }
    );
  }
}

