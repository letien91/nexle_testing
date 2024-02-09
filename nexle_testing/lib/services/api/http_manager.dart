import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nexle_testing/constants/strings.dart';
import 'package:nexle_testing/services/storage_manager.dart';

class HttpManager {
  Future<dynamic> get(String url,
      {Map<String, dynamic>? params, bool includeHeader = true}) async {
    final Map<String, String> headers = await _getHeaders();
    final String ext = _genUrlExtent(params);
    String processingUrl = url;
    if (ext.isNotEmpty) {
      processingUrl = '$url${'?$ext'}';
    }

    try {
      Response response;
      if (includeHeader) {
        response = await http
            .get(Uri.parse(processingUrl), headers: headers)
            .timeout(_timeoutDuration);
      } else {
        response =
            await http.get(Uri.parse(processingUrl)).timeout(_timeoutDuration);
      }

      log(
        '\n\nGET : $processingUrl\nparams: $params\n'
        '${response.statusCode}\n${response.body}\n',
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return _errorException(e);
    }
  }

  Future<String?> post(String url, {dynamic params}) async {
    final String? body = params != null ? jsonEncode(params) : null;
    final Map<String, String> headers = await _getHeaders();
    try {
      final http.Response response = await http
          .post(Uri.parse(url), headers: headers, body: body)
          .timeout(_timeoutDuration);

      log(
        '\n\nPOST: $url \nparams: $params'
        ' \nstatusCode: ${response.statusCode} \n${response.body}\n',
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      return _errorException(e);
    }
  }

  final Duration _timeoutDuration = const Duration(seconds: 20);

  static String? _errorException(Object e) {
    log('Exception ${e.toString()}');
    if (e is SocketException) {
      final Map<String, dynamic> rs = <String, dynamic>{
        'status': false,
        'message': 'Cannot connect with server',
        'error_code': 99,
      };
      return json.encode(rs);
    } else if (e is TimeoutException) {
      final Map<String, dynamic> rs = <String, dynamic>{
        'status': false,
        'message': 'Connection timeout',
        'error_code': 98,
      };
      return json.encode(rs);
    } else {
      final Map<String, dynamic> rs = <String, dynamic>{
        'status': false,
        'message': 'Cannot connect with server',
        'error_code': 97,
      };
      return json.encode(rs);
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
    };

    final String? authorization =
        await StorageManager.readData(kAuthorizationKey) as String?;
    log('authorization = $authorization');
    if (authorization != null) {
      headers[kAuthorizationKey] = authorization;
    }

    return headers;
  }

  String _genUrlExtent(Map<String, dynamic>? params) {
    if (params != null) {
      String ext = '';
      final List<String> pairs = <String>[];
      params.forEach((String key, dynamic value) {
        if (value != null) {
          pairs.add("${"$key="}${Uri.encodeComponent(value.toString())}");
        }
      });

      if (pairs.isNotEmpty) {
        ext = pairs.join('&');
      }

      return ext;
    }

    return '';
  }
}
