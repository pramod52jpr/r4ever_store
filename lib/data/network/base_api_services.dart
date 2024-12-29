abstract class BaseApiServices{

  Future<dynamic> getRequest(String url, {Map<String, dynamic> data = const {}});

  Future<dynamic> postRequest(String url, {Map<String, dynamic> data = const {}, bool withFile = false});

}