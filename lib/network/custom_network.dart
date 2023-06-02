import 'package:dio/dio.dart';

class CustomNetworkProvider {
  var dio = Dio();
  dynamic getData(
    String url,
  ) async {
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
  }
}
