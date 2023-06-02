import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/repository/weather_service.dart';

part 'weather_search_event.dart';
part 'weather_search_state.dart';

class WeatherSearchBloc extends Bloc<WeatherSearchEvent, WeatherSearchState> {
  WeatherRepository weatherRepository = WeatherRepository();
  WeatherSearchBloc() : super(WeatherSearchInitial()) {
    on<WeatherSearchEvent>((event, emit) async {
      if (event is WeatherSearchEventRequested) {
        print('event is executed');

        emit(WeatherSearchLoading());
        try {
          await weatherRepository
              .getWeatherData(cityName: event.searchQuery)
              .then((value) => emit(WeatherSearchLoaded(value)));
        } catch (e) {
          print('the error is $e');
          emit(WeatherSearchFailed());
        }
      }
    });
  }
}
