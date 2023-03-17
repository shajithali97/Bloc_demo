import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exception.dart';
import 'network_api_service_interface.dart';

class NetworkApiServiceImplementation extends NetworkApiServiceInterface {
// Define getApiResponse method
// Get response from API or caught the exception
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, Map params) async {
    dynamic responseJson;
    print(url);
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: params,
          )
          .timeout(const Duration(seconds: 10));
      print(response.statusCode);
      print(response.body);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

// Return the decode response or exception
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with serverwith status code${response.statusCode}');
    }
  }
}
