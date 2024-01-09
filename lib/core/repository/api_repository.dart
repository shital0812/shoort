import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shoort/core/prefrences/app_prefrences.dart';

class APIRepository {
  static const String BASE_URL = 'http://31.220.81.77:8089/api/v1'; // replace with your API endpoint
  static const String BASE_URL_Video = 'http://31.220.81.77:8089/api/v1'; // replace with your API endpoint
  static const int TIMEOUT_DURATION = 20; // replace with your desired timeout duration

  Future<http.Response> get(String path, {Map<String, String>? headers}) async {
    final url = Uri.parse('$BASE_URL$path');
    try {
      final response = await http.get(url, headers: headers).timeout(Duration(seconds: TIMEOUT_DURATION), );
      return response;
    } catch (error) {
      throw Exception('Failed to perform GET request: $error');
    }
  }

  Future<http.Response> post(String path, {Map<String, String>? headers = const {'Content-Type': 'application/json'} , dynamic body}) async {

    final url = Uri.parse('$BASE_URL$path');
    try {
      final response = await http.post(url,headers:headers,body: jsonEncode(body)).timeout(Duration(seconds: TIMEOUT_DURATION));
      return response;
    } catch (error) {
      throw Exception('Failed to perform POST request: $error');
    }
  }

  Future<http.Response> put(String path, {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$BASE_URL$path');
    try {
      final response = await http.put(url, headers: headers, body: jsonEncode(body)).timeout(Duration(seconds: TIMEOUT_DURATION));
      return response;
    } catch (error) {
      throw Exception('Failed to perform PUT request: $error');
    }
  }

  Future<http.Response> delete(String path, {Map<String, String>? headers}) async {
    final url = Uri.parse('$BASE_URL$path');
    try {
      final response = await http.delete(url, headers: headers).timeout(Duration(seconds: TIMEOUT_DURATION));
      return response;
    } catch (error) {
      throw Exception('Failed to perform DELETE request: $error');
    }
  }

  Future<http.Response> uploadFile({required url,required filePath, required String fileKey}) async {

    final reqUrl = Uri.parse("${BASE_URL}$url");


    final request = http.MultipartRequest('POST', reqUrl);
     request.headers['Authorization'] = await 'Bearer ${AppPrefrences.getAppUserToken()}';
     request.files.add(await http.MultipartFile.fromPath(fileKey, filePath));

    final stream = await request.send();
    final result = await http.Response.fromStream(stream);
    return result;

  }

  Future<http.Response> uploadVideoFile({required url,required filePath, required String fileKey, required String title}) async {

    final reqUrl = Uri.parse("${BASE_URL_Video}$url");

    final request =await http.MultipartRequest('POST', reqUrl);
    request.headers['Authorization'] =
        await 'Bearer ${AppPrefrences.getAppUserToken()}';
    request.fields["title"] = title;
    request.files.add(await http.MultipartFile.fromPath(fileKey, filePath));

    final stream = await request.send();
    final result = await http.Response.fromStream(stream);
    return result;


  }


}


/*


class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  double _progress = 0.0;
  late File _file;

  Future<void> _selectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _file = File(result.files.single.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_file != null) ...[
              Image.file(_file),
              SizedBox(height: 16.0),
              LinearProgressIndicator(value: _progress),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _uploadFile,
                child: Text('Upload File'),
              ),
            ],
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectFile,
              child: Text('Select File'),
            ),
          ],
        ),
      ),
    );
  }
}*/
