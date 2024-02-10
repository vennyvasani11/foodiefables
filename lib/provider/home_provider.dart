import 'package:foodiefables/utils/Constant.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = Constants.baseUrl;
    httpClient.timeout = const Duration(minutes: 1);

    httpClient.addRequestModifier((Request request) async {
      request.headers['api-key'] = Constants.food_app_api_key;
      request.headers['Content-Type'] = Constants.applicationJson;

      return request;
    });
  }

  Future<Response> allRecipe(request) async =>
      await post('action/find', request);

  Future<Response> register(request) async =>
      await post('action/insertOne', request);

  // Future<Response> deletedJob(request) async => await post('job/DeleteJob?job_id',request);

  // Future<Response> getMyJobs(request) async => await get('job/GetMyJobs',query: request);
}
