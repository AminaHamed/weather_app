import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import '../services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit({required this.weatherService}) : super(LoadingInitial());
  final WeatherService weatherService;
  WeatherModel? weatherModel;
  String? city;

  Future<void> getWeather({required String city}) async {
    emit(LoadingData());
    try {
      weatherModel = await weatherService.getWeather(cityName: city);
      emit(LoadingSuccess());
    } on Exception catch (e) {
      emit(LoadingFailure());
    }
  }
}
