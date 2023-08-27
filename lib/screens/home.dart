import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:mausam/screens/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String icon = arguments['icon'];

    Widget iconWidget;

    if (icon != 'N/A') {
      iconWidget = Image.network(
        'https://openweathermap.org/img/wn/${arguments['icon']}@2x.png',
      );
    } else {
      iconWidget = const Text(
        'N/A',
        style: TextStyle(fontSize: 20),
      ); 
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.deepPurple
              ], // Adjust the gradient colors
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white70),
                  padding: const EdgeInsets.fromLTRB(20, 5, 8, 5),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoadingScreen(
                                    location: location.text,
                                  ),
                                ));
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.blue,
                          )),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: location,
                          decoration: const InputDecoration(
                              hintText: 'Enter any city name',
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Row(
                          children: [
                            iconWidget,
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  arguments['description'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  arguments['city'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 230,
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(WeatherIcons.wiThermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  arguments['temp'] is double
                                      ? arguments['temp'].toStringAsFixed(2)
                                      : arguments['temp'],
                                  style: const TextStyle(
                                    fontSize: 90,
                                  ),
                                ),
                                const Text(
                                  'C',
                                  style: TextStyle(
                                    fontSize: 50,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(WeatherIcons.wiDayWindy),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              arguments['wind_speed'].toString(),
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text('km/hr')
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(26),
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Icon(WeatherIcons.wiHumidity),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              arguments['humidity'].toString(),
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text('Percent')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text("Made by Rijan Kunwar")],
                ))
              ],
            ),
          ),
        ));
  }
}
