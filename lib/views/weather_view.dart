import 'package:flutter/material.dart';
import 'package:weather/models/get_weather_model.dart';

import 'search_view.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key, required this.model});

  final WeatherData model;
  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather in ${widget.model.cityName}',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // Color.fromARGB(255, 6, 105, 185),
                Colors.white,
                Theme.of(context).primaryColor.withOpacity(0.1),
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Theme.of(context).primaryColor.withOpacity(0.1),
                Colors.white,
              ],
            ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.model.cityName,
              style:  TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Update at: ${widget.model.date.year}-${widget.model.date.month}-${widget.model.date.day}"),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //  Image.network(widget.model.image, height: 15,),
                Text(
                  'Temp: ${widget.model.temp}',
                  style:  TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold , color: Theme.of(context).primaryColor),
                ),
                Column(
                  children: [
                    Text('Max Temp: ${widget.model.maxTemp}'),
                    Text('min Temp: ${widget.model.minTemp}'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.model.weatherCond,
              style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 50,
            ),

           FilledButton(
            style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Text(
              'Search about weather',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
          ),
          ],
        ),
      ),
    );
  }
}
