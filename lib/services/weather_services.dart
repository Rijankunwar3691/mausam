import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherServices {
  static Future<Map> getdata(String ?location) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=4e6b1580c30d7410e7400a25ada7a1d9';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    Map data = jsonDecode(response.body);
    print(location);
    return data;

    // //getting description
    // List weather_data = data['weather'];
    // Map weather_main_data = weather_data[0];
    // String weather_main_data_main = weather_main_data['main'];
    // String weather_main_data_description = weather_main_data['description'];

    // //getting temp,humidity
    // Map temp_data = data['main'];
    // double temp_temp_data = temp_data['temp'];
    // double temp_data_humidity = temp_data['humidity'];

    // //getting wind
    // Map wind_data = data['wind'];
    // double wind_data_speed = wind_data['speed'];
  }
}
