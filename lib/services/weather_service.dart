import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;
  WeatherService(this.apiKey);

  Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(Uri.parse('$BASE_URL?q=$city&appid=$apiKey&units=metric'));
    
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
  
  Future<String> getCurrentCity() async {
     LocationPermission permission = await Geolocator.requestPermission();
      
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      //fetch the current location
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

      String? city = placemarks[0].locality;

      return city ?? " ";
  }
}