class WeatherData {
  late final String cityName;
  late final DateTime date;
  late final String image;
  late final double maxTemp;
  late final double minTemp;
  late final double temp;
  late final String weatherCond;

  WeatherData.fromJson(json) {
    cityName = json['location']['name'];
    var jsonData = json['forecast']['forecastday'][0]['day'];
    date = DateTime.parse(json['current']['last_updated']);
    temp = jsonData['avgtemp_c'];
    maxTemp = jsonData['maxtemp_c'];
    minTemp = jsonData['mintemp_c'];
    weatherCond = jsonData['condition']['text'];
    image = jsonData['condition']['icon'];
  }
}

