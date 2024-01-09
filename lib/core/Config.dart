class Config {
  String BASE_URL = "";
  String ST_CORE_BASE_URL = ""; //
  String WEB_BASE_URL = "";
  String RAZORPAY_API_KEY = "";
  String PLACES_API_KEY="";
  String PLACES_SEARCH_BASE_URL = "";
  AppMode appMode = AppMode.STAGING;

  AppMode getAppMode() {
    return appMode;
  }

  String getBaseURL() {
    init(appMode);
    return BASE_URL;
  }

  String getStCoreBaseURL() {
    init(appMode);
    return ST_CORE_BASE_URL;
  }

  String getWebBaseURL() {
    init(appMode);
    return WEB_BASE_URL;
  }

  String getRazorpayApiKey() {
    init(appMode);
    return RAZORPAY_API_KEY;
  }

  String getPlacesApiKey() {
    init(appMode);
    return PLACES_API_KEY;
  }

  String getPlacesSearchBaseURL() {
    init(appMode);
    return PLACES_SEARCH_BASE_URL;
  }

  void init(AppMode appMode) {
    switch (appMode) {
      case AppMode.LIVE:
        {
          BASE_URL = "https://admin.revv.co.in";
          WEB_BASE_URL = "https://revv.co.in/";
          RAZORPAY_API_KEY = "rzp_live_BPnHr8MDcSFQQt";
          ST_CORE_BASE_URL = "https://test1-st.eks.revv.co.in/";
          PLACES_API_KEY = "AIzaSyDKtCz5LVA9jBaFjMXE3uWb7jJFxvsOODc";
          PLACES_SEARCH_BASE_URL="https://maps.googleapis.com/";
        }
        break;
      case AppMode.DEPLOYEMENT:
        {
          BASE_URL = "http://beta-admin.revv.co.in";
          WEB_BASE_URL = "http://www.beta.revv.co.in/";
          RAZORPAY_API_KEY = "rzp_live_BPnHr8MDcSFQQt";
          PLACES_API_KEY = "AIzaSyDKtCz5LVA9jBaFjMXE3uWb7jJFxvsOODc";
          PLACES_SEARCH_BASE_URL="https://maps.googleapis.com/";
          ST_CORE_BASE_URL = "https://test1-st.eks.revv.co.in/";
        }
        break;

      case AppMode.STAGING:
        {
//                BASE_URL = "http://13.126.187.59:3000";
//                BASE_URL = "http://13.233.156.220:3000";
//                BASE_URL = "http://15.206.31.63:3000";
//                BASE_URL = "https://admin.revv.co.in"
//                BASE_URL = "https://staging1.admin.revv.co.in";
          WEB_BASE_URL = "http://test10.revv.co.in/";
          ST_CORE_BASE_URL = "https://test2-st.eks.revv.co.in/";
//                WEB_BASE_URL = "https://www.revv.co.in/";
//                BASE_URL = "https://1258018f2db9.ngrok.io";
//                BASE_URL = "http://15.206.31.63:3000";
//                BASE_URL = "https://dev4.admin.revv.co.in";
//                BASE_URL = "https://admin.revv.co.in";
          BASE_URL = "http://test4.admin.revv.co.in";
//                BASE_URL = "http://test10-admin.revv.co.in";
//                BASE_URL = "http://test9-admin.revv.co.in";
          RAZORPAY_API_KEY = "rzp_test_cfIBUDRacgzIgw";
          PLACES_API_KEY = "AIzaSyDKtCz5LVA9jBaFjMXE3uWb7jJFxvsOODc";
          PLACES_SEARCH_BASE_URL="https://maps.googleapis.com/";
        }
        break;
    }
  }
}

enum AppMode { LIVE, STAGING, DEPLOYEMENT }
