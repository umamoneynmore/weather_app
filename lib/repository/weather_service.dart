import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/network/custom_network.dart';

class WeatherRepository {
  CustomNetworkProvider customNetworkProvider = CustomNetworkProvider();

  Future<List<WeatherModel>> getWeatherData({String? cityName}) async {
    print("$cityName city name ");
    final response = await customNetworkProvider.getData(
        "https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=1");

    final List<WeatherModel> data = response["results"]
        .map((item) => WeatherModel.fromJson(item as Map<String, dynamic>))
        .toList()
        .cast<WeatherModel>();

    return data;
  }
}
