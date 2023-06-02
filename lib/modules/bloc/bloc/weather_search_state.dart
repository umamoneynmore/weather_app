part of 'weather_search_bloc.dart';

@immutable
abstract class WeatherSearchState {}

class WeatherSearchInitial extends WeatherSearchState {}

class WeatherSearchLoading extends WeatherSearchState {}

class WeatherSearchLoaded extends WeatherSearchState {
  final List<WeatherModel> weatherData;

  WeatherSearchLoaded(this.weatherData);
}

class WeatherSearchFailed extends WeatherSearchState {}
