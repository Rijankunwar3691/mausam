import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mausam/services/weather_services.dart';

class LoadingScreen extends StatefulWidget {
  final String? location;
  const LoadingScreen({super.key, this.location});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Map data = {};
  Future<void> getdata() async {
    Map result = await WeatherServices.getdata(widget.location);
    setState(() {
      data = result;
    });
  }

  @override
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await getdata();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (data['cod'] == 200) {
          double tempKelvin = data['main']['temp'];
          double tempCelsius = tempKelvin - 273.15;

          List weather_data = data['weather'];
          Map weather_main_data = weather_data[0];
          String weather_main_data_main = weather_main_data['main'];
          String weather_main_data_description =
              weather_main_data['description'];
          Map<String, dynamic> argument = {
            'temp': tempCelsius,
            'wind_speed': data['wind']['speed'],
            'humidity': data['main']['humidity'],
            'description': weather_main_data_description,
            'weather_main': weather_main_data_main,
            'icon': weather_main_data['icon'].toString(),
            'city': data['name']
          };
          Navigator.pushReplacementNamed(context, '/home', arguments: argument);
        } else {
          Map<String, dynamic> argument = {
            'temp': 'N/A',
            'wind_speed': 'N/A',
            'humidity': 'N/A',
            'description': 'N/A',
            'weather_main': 'N/A',
            'icon': 'N/A',
            'city': 'N/A'
          };
          Navigator.pushReplacementNamed(context, '/home', arguments: argument);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/mausam.logo.png', height: 200),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Mausam App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Made by Rijan",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 10,
            ),
            const SpinKitWave(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    ));
  }
}
