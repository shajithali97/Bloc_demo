import 'package:bloc_login_demo/core/api_service/network_api_service_interface.dart';

import '../../../core/api_service/network_api_service_implementation.dart';
import '../../../core/constants/api_constant.dart';

class SearchRepository {
// Create instance for NetworkAoiServiceInterface
  final NetworkApiServiceInterface _apiServices =
      NetworkApiServiceImplementation();
// Fetch the song list from API
  Future<dynamic> fetchProductList() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(ApiConstant.productSearchUrl);
      print(response.runtimeType);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
