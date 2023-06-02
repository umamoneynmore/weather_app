

class WeatherModel {
    int? id;
    String? name;
    double? latitude;
    double? longitude;
    double? elevation;
    String? featureCode;
    String? countryCode;
    String? timezone;
    int? population;
    int? countryId;
    String? country;

    WeatherModel({
        this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.elevation,
        this.featureCode,
        this.countryCode,
        this.timezone,
        this.population,
        this.countryId,
        this.country,
    });

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        elevation: json["elevation"],
        featureCode: json["feature_code"],
        countryCode: json["country_code"],
        timezone: json["timezone"],
        population: json["population"],
        countryId: json["country_id"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "feature_code": featureCode,
        "country_code": countryCode,
        "timezone": timezone,
        "population": population,
        "country_id": countryId,
        "country": country,
    };
}
