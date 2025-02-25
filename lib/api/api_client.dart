import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:bunny_ngim_app/model/response/error_response.dart';
import 'package:bunny_ngim_app/util/app_constants.dart';
import 'package:get/get_connect/http/src/request/request.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as Http;
import 'package:flutter/foundation.dart' as Foundation;

class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  String? token;
  Map<String, String>? _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "token";
    debugPrint('Token: $token');
    updateHeader(token, 'km');
  }

  void updateHeader(String? token, String languageCode) {
    _mainHeaders = {
      "Accept": "application/json",
      'Content-Type': 'application/json; charset=UTF-8',
      AppConstants.LOCALIZATION_KEY: languageCode,
      'Authorization': 'Bearer 1|4ddXojpcjWOY1a5jsCqyaP18vB7ABovg4mlo8UOQ',
    };
  }

  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      print('------------${e.toString()}');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      http.Response _response = await http
          .post(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
  }) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body with ${multipartBody.length} files');
      Http.MultipartRequest _request = Http.MultipartRequest(
        'POST',
        Uri.parse(appBaseUrl + uri),
      );
      _request.headers.addAll(headers ?? _mainHeaders!);
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          if (Foundation.kIsWeb) {
            Uint8List _list = await multipart.file.readAsBytes();
            Http.MultipartFile _part = Http.MultipartFile(
              multipart.key,
              multipart.file.readAsBytes().asStream(),
              _list.length,
              filename: basename(multipart.file.path),
              contentType: MediaType('image', 'jpg'),
            );
            _request.files.add(_part);
          } else {
            File _file = File(multipart.file.path);
            _request.files.add(
              Http.MultipartFile(
                multipart.key,
                _file.readAsBytes().asStream(),
                _file.lengthSync(),
                filename: _file.path.split('/').last,
              ),
            );
          }
        }
      }
      _request.fields.addAll(body);

      Http.Response _response = await Http.Response.fromStream(
        await _request.send(),
      );
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData2(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody, {
    Map<String, String>? headers,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: ${jsonEncode(headers ?? {})}');
        print(
          '====> API Body: ${jsonEncode(body)} with ${multipartBody.length} pictures',
        );
      }

      Http.MultipartRequest _request = Http.MultipartRequest(
        'POST',
        Uri.parse(appBaseUrl + uri),
      );
      _request.headers.addAll(headers ?? {});

      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null) {
          print('====> multipart: ${multipart.file.path}');

          Uint8List _list = await multipart.file.readAsBytes();
          _request.files.add(
            Http.MultipartFile(
              multipart.key,
              multipart.file.readAsBytes().asStream(),
              _list.length,
              filename:
                  '${DateTime.now().toString()}.${multipart.file.path.split('.').last}',
            ),
          );
        } else {
          print('Error: MultipartBody file is null.');
        }
      }

      _request.fields.addAll(body);

      Http.StreamedResponse _streamedResponse = await _request.send();
      Http.Response _response = await Http.Response.fromStream(
        _streamedResponse,
      );

      if (Foundation.kDebugMode) {
        print('====> API Response: ${_response.statusCode}\n${_response.body}');
      }

      return handleResponse(_response, uri);
    } catch (e) {
      print('Error: $e');
      return const Response(
        statusCode: 1,
        statusText: 'No internet connection',
      );
    }
  }

  Future<Response> putData(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      Http.Response _response = await Http.put(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> delete(
    String uri,
    dynamic body, {
    Map<String, String>? headers,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(
    String uri, {
    Map<String, String>? headers,
  }) async {
    try {
      if (Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}
    Response _response = Response(
      body: _body != null ? _body : response.body,
      bodyString: response.body.toString(),
      request: Request(
        headers: response.request!.headers,
        method: response.request!.method,
        url: response.request!.url,
      ),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (_response.statusCode != 200 &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse _errorResponse = ErrorResponse.fromJson(_response.body);
        _response = Response(
          statusCode: _response.statusCode,
          body: _response.body,
          statusText: _errorResponse.errors![0].message,
        );
      } else if (_response.body.toString().startsWith('{message')) {
        _response = Response(
          statusCode: _response.statusCode,
          body: _response.body,
          statusText: _response.body['message'],
        );
      }
    } else if (_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    if (Foundation.kDebugMode) {
      log('====> API URI: [${_response.statusCode}] $uri');
      log('====> API Data: ${jsonEncode(_body)}');
    }
    return _response;
  }
}

class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
