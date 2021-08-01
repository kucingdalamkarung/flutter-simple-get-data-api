class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompany.fromJson(dynamic json) {
    id = json["id"];
    logoPath = json["logo_path"];
    name = json["name"];
    originCountry = json["origin_country"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["logo_path"] = logoPath;
    map["name"] = name;
    map["origin_country"] = originCountry;
    return map;
  }
}
