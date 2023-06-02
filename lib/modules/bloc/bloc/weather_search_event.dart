part of 'weather_search_bloc.dart';

@immutable
abstract class WeatherSearchEvent {}

class WeatherSearchEventRequested extends WeatherSearchEvent {
  final String searchQuery;

  WeatherSearchEventRequested(this.searchQuery);

  
}


