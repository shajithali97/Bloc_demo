import '../../../../core/api_service/network_api_service_implementation.dart';
import '../../../../core/api_service/network_api_service_interface.dart';
import '../../../../core/constants/api_constant.dart';

class AuthRepository {
// Create instance for NetworkAoiServiceInterface
  final NetworkApiServiceInterface _apiServices =
      NetworkApiServiceImplementation();
// Fetch the song list from API
  Future<dynamic> loginApi(Map params) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(ApiConstant.loginUrl, params);
      return response;
// return response = .fromJson(response);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<dynamic> registerApi(Map params) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(ApiConstant.registerUrl, params);
      return response;
// return response = .fromJson(response);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
