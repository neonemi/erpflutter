import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'app_apis.dart';

class ApiProvider {
  final int _timeOut = 50;

  // This method will create a URL with base app API
  Uri getUri(String path, {Map<String, dynamic>? queryParameters}) {
    String url = Apis.baseUrl;
    String uriPath = path;

    if (url.contains('/')) {
      final List<String> urlSegment = url.split('/');

      url = urlSegment[0];

      if (uriPath.startsWith('/')) {
        uriPath = uriPath.substring(1);
      }

      uriPath = '/${urlSegment.sublist(1).join('/')}/$uriPath';
    }
    //return Uri.http(url, uriPath, queryParameters);
    return Uri.https(url, uriPath, queryParameters);
  }

  Future<dynamic> get(Uri endPoint) async {
    late http.Response response;
    try {
      response = await http.get(endPoint).timeout(
            Duration(seconds: _timeOut),
            onTimeout: _onTimeOut,
          );
    } catch (e) {
      throw (Exception(e.toString()));
    }
    return await _handleResponse(response);
  }

  Future<dynamic> post({
    Object? requestBody,
    required Uri endPoint,
    HttpHeaders? headers,
    bool formEncode = false,
    bool auth = true,
  }) async {
    http.Response response;
    try {
      response = await http.post(endPoint, body: requestBody).timeout(
            Duration(seconds: _timeOut),
            onTimeout: _onTimeOut,
          );
    } catch (e) {
      throw (Exception(e.toString()));
    }

    return await _handleResponse(response);
  }

  Future<dynamic> put({
    Object? requestBody,
    required Uri endPoint,
    bool auth = true,
  }) async {
    late http.Response response;
    try {
      response = await http
          .put(
            endPoint,
            body: requestBody,
            //   encoding: Encoding.getByName("utf-8")
          )
          .timeout(
            Duration(seconds: _timeOut),
            onTimeout: _onTimeOut,
          );
    } catch (e) {
      throw (Exception(e.toString()));
    }

    return await _handleResponse(response);
  }

  Future<dynamic> delete({
    Object? requestBody,
    required Uri endPoint,
    bool auth = true,
  }) async {
    late http.Response response;
    try {
      response = await http
          .delete(
            endPoint,
            // body: requestBody,

            //   encoding: Encoding.getByName("utf-8")
          )
          .timeout(
            Duration(seconds: _timeOut),
            onTimeout: _onTimeOut,
          );
    } catch (e) {
      throw (Exception(e.toString()));
    }
    final Map<String, dynamic> res = json.decode(response.body);
    bool success = res['success'];

    return success;
  }

  postMultipart({
    var request,
    bool setContentType = true,
  }) async {
    if (setContentType) {
      request.headers["Content-Type"] = 'multipart/form-data';
    }
    request.headers["Accept"] = 'application/json; charset=utf-8';

    var streamResponse = await request.send();
    late http.Response response;
    try {
      response = await http.Response.fromStream(streamResponse);
    } catch (e) {
      throw (Exception(e.toString()));
    }
    return await _handleResponse(response);
  }

  FutureOr<http.Response> _onTimeOut() {
    return http.Response("{'message':'Time Out'}", -1);
  }

  /// Handle response from API
  Future<dynamic> _handleResponse(http.Response response) async {
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      final Map<String, dynamic> res = json.decode(response.body);
      bool success = res['success'];
      if (success) {
        return res['data'];
      } else {
        throw (Exception(res['message']));
      }
    } else {
      var errorTitle = json.decode(response.body)['errors'];
      String mAlert = "- ";
      errorTitle.forEach((key, value) {
        var errorList = value;
        for (errorList in errorList) {
          if (mAlert == "- ") {
            mAlert = mAlert + errorList;
          } else {
            mAlert = "$mAlert\n$errorList";
          }
        }
      });
      throw (Exception("api $mAlert"));
    }
  }

  Future<dynamic> postPagination({
    Object? requestBody,
    required Uri endPoint,
    HttpHeaders? headers,
    bool formEncode = false,
    bool auth = true,
  }) async {
    http.Response response;
    try {
      response = await http.post(endPoint, body: requestBody).timeout(
            Duration(seconds: _timeOut),
            onTimeout: _onTimeOut,
          );
    } catch (e) {
      throw (Exception(e.toString()));
    }

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      final Map<String, dynamic> res = json.decode(response.body);
      bool success = res['success'];
      if (success) {
        return res;
      } else {
        throw (Exception(res['message']));
      }
    } else {
      var errorTitle = json.decode(response.body)['errors'];
      String mAlert = "- ";
      errorTitle.forEach((key, value) {
        var errorList = value;
        for (errorList in errorList) {
          if (mAlert == "- ") {
            mAlert = mAlert + errorList;
          } else {
            mAlert = "$mAlert\n$errorList";
          }
        }
      });
      throw (Exception("api $mAlert"));
    }
  }
}
