import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../core/mixins/service_mixin.dart';
import 'package:mobkit_flutter_servicebase/providers/http_provider.dart';

import '../../../main.dart';
import '../../models/response/error_model.dart';
import '../../models/response/response_model.dart';

class AlgoritmikServiceBase extends HttpProvider with ServiceMixin {
  Future<ResponseModel> postMapAsync<T>(
    String url,
    Map<String, String>? headers,
    String jsonData,
    Encoding? encoding,
  ) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp =
          await postAsync(uri.toString(), headers, jsonData, encoding);
      if (!isTest) {
        if (resp.statusCode == 200) {
          return compute(handleResponse<T>, resp.body);
        } else {
          return handleErrors(resp.statusCode, resp);
        }
      }
      return handleResponse<T>(resp.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<ResponseModel> postMultiPartFileAsync<T>(
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
        if (resp.statusCode == 200) {
          return compute(handleResponse<T>, streamResponse.body);
        } else {
          return handleErrors(resp.statusCode, null);
        }
      }
      return handleResponse<T>(streamResponse.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<ResponseModel> getMapAsync<T>(
    String url,
    Map<String, String>? headers,
    Encoding? encoding,
  ) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp = await getAsync(uri.toString(), headers, encoding);
      if (!isTest) {
        if (resp.statusCode == 200) {
          return compute(handleResponse<T>, resp.body);
        } else {
          return handleErrors(resp.statusCode, resp);
        }
      }
      return handleResponse<T>(resp.body);
    } catch (exception) {
      _logErrors(exception);
      throw Exception(exception);
    }
  }

  Future<ResponseModel> putMapAsync<T, R>(String url,
      Map<String, String>? headers, String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp =
          await putAsync(uri.toString(), headers, jsonData, encoding);
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

  Future<ResponseModel> patchMapAsync<T, R>(String url,
      Map<String, String>? headers, String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp =
          await patchAsync(uri.toString(), headers, jsonData, encoding);
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

  Future<ResponseModel> deleteMapAsync<T, R>(String url,
      Map<String, String>? headers, String jsonData, Encoding? encoding) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response resp =
          await deleteAsync(uri.toString(), headers, jsonData, encoding);
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

  ResponseModel handleErrors(int statusCode, http.Response? resp) {
    String errorMessage =
        "statusCode : $statusCode- reason ${resp?.reasonPhrase} - ${resp?.body.toString()}";
    return ResponseModel(
        isSuccess: false,
        statusCode: statusCode,
        errorModel: ErrorModel(errorMessage),
        body: resp?.body);
  }

  ResponseModel handleResponse<T>(String body) {
    var response = ResponseModel<T>(isSuccess: true);
    response.statusCode = 200;
    if (T == String) {
      response.body = body as T;
    } else if (T == int) {
      response.body = (int.tryParse(body) ?? 0) as T;
    } else if (body == "") {
    } else {
      return ResponseModel.fromMap(jsonDecode(body));
    }
    return response;
  }

  _logErrors(Object ex) {
    logger.logSevere(ex);
  }
}
