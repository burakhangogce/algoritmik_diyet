import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/mixins/service_mixin.dart';
import 'package:mobkit_flutter_servicebase/providers/http_provider.dart';

import '../../../main.dart';

class AlgoritmikServiceBase extends HttpProvider with ServiceMixin {
  Future<T> postMapAsync<T>(
    String url,
    Map<String, String>? headers,
    String jsonData,
    Encoding? encoding,
  ) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.post(uri,
          headers: headers, body: jsonData, encoding: encoding);

      var cookie = resp.headers["set-cookie"];
      if (cookie != null && cookie.isNotEmpty) {
        if (settingService.get<String>("cookie")?.isNotEmpty ?? false) {
          settingService.removeAsync("cookie");
        }
        settingService.setAsync<String>("cookie", cookie);
      }
      if (!isTest) {
        return compute(handleResponse<T>, resp.body);
      }
      return handleResponse<T>(resp.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> postMultiPartFileAsync<T>(
    String url,
    Map<String, String>? headers,
    File file,
    Encoding? encoding,
  ) async {
    Uri uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath(
        'data',
        file.path,
      ));
      request.headers.addAll(headers!);

      http.StreamedResponse resp = await request.send();
      var cookie = resp.headers["set-cookie"];
      if (cookie != null && cookie.isNotEmpty) {
        if (settingService.get<String>("cookie")?.isNotEmpty ?? false) {
          settingService.removeAsync("cookie");
        }
        settingService.setAsync<String>("cookie", cookie);
      }

      var streamResponse = await http.Response.fromStream(resp);
      if (!isTest) {
        return compute(handleResponse<T>, streamResponse.body);
      }
      return handleResponse<T>(streamResponse.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> getMapAsync<T>(
    String url,
    Map<String, String>? headers,
    Encoding? encoding,
  ) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.get(uri, headers: headers);
      if (!isTest) {
        return compute(handleResponse<T>, resp.body);
      }
      return handleResponse<T>(resp.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> putMapAsync<T, R>(String url, Map<String, String>? headers,
      String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.put(uri,
          headers: headers, body: jsonData, encoding: encoding);
      return compute(handleResponse<T>, resp.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> patchMapAsync<T, R>(String url, Map<String, String>? headers,
      String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.patch(uri,
          headers: headers, body: jsonData, encoding: encoding);
      return compute(handleResponse<T>, resp.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<T> deleteMapAsync<T, R>(String url, Map<String, String>? headers,
      String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await http.delete(uri,
          headers: headers, body: jsonData, encoding: encoding);
      if (resp.statusCode == 200) {
        return compute(handleResponse<T>, resp.body);
      } else {
        return handleErrors(resp.statusCode, resp);
      }
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  handleErrors(int statusCode, http.Response resp) {
    throw Exception(
        "statusCode : $statusCode- reason ${resp.reasonPhrase} - ${resp.body.toString()}");
  }

  T handleResponse<T>(String body) {
    if (T is String) {
      return body as T;
    } else if (T is int) {
      return (int.tryParse(body) ?? 0) as T;
    }

    return body == "" ? "" : jsonDecode(body);
  }

  _logErrors(Object ex) {
    logger.logSevere(ex);
  }
}
