import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubits/weather_state.dart';
import 'package:weather_app/services/weather_services.dart';

import '../../models/weather_model.dart';


class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherIntialState());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadinState());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherFailureaState());
    }
  }
}