import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:shibika/dto/authdata.dart';

class HttpClient {
  final String baseUrl;
  Map<String, String> headers = {
    // 'Content-type': 'application/json',
    'Content-type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };

  HttpClient(this.baseUrl);

  Future<http.Response> get(String route) async {
    // await addAuthHeaders(AuthenticateRequest);
    var url = '$baseUrl/$route';
    var client = new http.Client();
    var httpResponse = client.get(url, headers: headers);
    return httpResponse;
  }

  Future<http.Response> post(String route,
      {dynamic data}) async {
    // await addAuthHeaders(AuthenticateRequest);
    var url = '$baseUrl/$route';
    var client = new http.Client();
    var post = client.post(url, headers: headers, body: jsonEncode(data));
    return post;
  }

  // Future addAuthHeaders(bool AuthenticateRequest) async {
  //   if (!AuthenticateRequest) {
  //     headers['authorization'] = '';
  //   } else {
  //     headers['authorization'] = await _getAuthHeaders();
  //     //print(headers['authorization']);
  //   }
  // }

  // Future<http.Response> login(dynamic data) async {
  //   var loginResponse =
  //       await this.post("auth/login", AuthenticateRequest: false, data: data);
  //   return loginResponse;
  // }

  // Future<http.Response> changePassword(dynamic data) async {
  //   var changePasswordResponse = await this
  //       .post("users/resetpassword", AuthenticateRequest: true, data: data);
  //   print('Data:$data');
  //   return changePasswordResponse;
  // }


  // _getAuthHeaders() async {
  //   // Authorization auth = await Authorization.load();
  //   //print(auth.token);
  //   //print (jsonEncode({'authorization': auth.token}));
  //   //return jsonEncode(auth.token);
  //   //return jsonEncode({'authorization': auth.token});
  //   // return auth.token;
  // }
}
