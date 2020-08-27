class CurrentWeather {
  final Coord coord;
  final Weather weather;
  final String base, name;
  final Main main;
  final int visibility, dt, timeZone, id, cod;
  final Wind wind;
  final Clouds clouds;
  final Sys sys;

  CurrentWeather({
    this.coord,
    this.weather,
    this.base,
    this.name,
    this.main,
    this.visibility,
    this.dt,
    this.timeZone,
    this.id,
    this.cod,
    this.wind,
    this.clouds,
    this.sys,
  });

  CurrentWeather.fromJson(Map<String, dynamic> json)
      : coord = Coord.fromJson(json['coord']),
        weather = Weather.fromJson(json['weather']),
        base = json['base'],
        main = Main.fromJson(json['main']),
        visibility = json['visibility'],
        wind = Wind.fromJson(json['wind']),
        clouds = Clouds.fromJson(json['clouds']),
        dt = json['td'],
        sys = Sys.fromJson(json['sys']),
        timeZone = json['timeZone'],
        id = json['id'],
        name = json['name'],
        cod = json['cod'];
}

class Coord {
  final double lon, lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json)
      : lon = json['lon'],
        lat = json['lat'];
}

class Weather {
  final int id;
  final String main, desc, icon;

  Weather({this.id, this.main, this.desc, this.icon});

  Weather.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        desc = json['description'],
        icon = json['icon'];
}

class Main {
  final int pressure, humidity;
  final double temp, feelsLike, tempMin, tempMax;

  Main({
    this.pressure,
    this.humidity,
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
  });

  Main.fromJson(Map<String, dynamic> json)
      : pressure = json['pressure'],
        humidity = json['humidity'],
        temp = json['temp'],
        feelsLike = json['feels_like'],
        tempMin = json['temp_min'],
        tempMax = json['temp_max'];
}

class Wind {
  final int deg;
  final double speed;

  Wind({this.deg, this.speed});

  Wind.fromJson(Map<String, dynamic> json)
      : deg = json['deg'],
        speed = json['speed'];
}

class Clouds {
  final int all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) : all = json['all'];
}

class Sys {
  final type, id, sunrise, sunset;
  final String country;

  Sys({this.type, this.id, this.sunrise, this.sunset, this.country});

  Sys.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        sunrise = json['sunrise'],
        sunset = json['sunset'],
        country = json['country'];
}
