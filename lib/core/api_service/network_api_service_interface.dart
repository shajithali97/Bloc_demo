abstract class NetworkApiServiceInterface {
// Declare method getApiResponse
  Future<dynamic> getApiResponse(String url);
  Future<dynamic> postApiResponse(String url, Map params);
}
