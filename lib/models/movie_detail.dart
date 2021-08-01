import 'belongs_to_collection.dart';
import 'genres.dart';
import 'production_companies.dart';
import 'production_countries.dart';
import 'spoken_languages.dart';

class MovieDetail {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetail(
      {this.adult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieDetail.fromJson(dynamic json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"];
    belongsToCollection =
        json["belongs_to_collection"] != null ? BelongsToCollection.fromJson(json["belongsToCollection"]) : null;
    budget = json["budget"];
    if (json["genres"] != null) {
      genres = [];
      json["genres"].forEach((v) {
        genres?.add(Genre.fromJson(v));
      });
    }
    homepage = json["homepage"];
    id = json["id"];
    imdbId = json["imdb_id"];
    originalLanguage = json["original_language"];
    originalTitle = json["original_title"];
    overview = json["overview"];
    popularity = json["popularity"];
    posterPath = json["poster_path"];
    if (json["production_companies"] != null) {
      productionCompanies = [];
      json["production_companies"].forEach((v) {
        productionCompanies?.add(ProductionCompany.fromJson(v));
      });
    }
    if (json["production_countries"] != null) {
      productionCountries = [];
      json["production_countries"].forEach((v) {
        productionCountries?.add(ProductionCountry.fromJson(v));
      });
    }
    releaseDate = json["release_date"];
    revenue = json["revenue"];
    runtime = json["runtime"];
    if (json["spoken_languages"] != null) {
      spokenLanguages = [];
      json["spoken_languages"].forEach((v) {
        spokenLanguages?.add(SpokenLanguage.fromJson(v));
      });
    }
    status = json["status"];
    tagline = json["tagline"];
    title = json["title"];
    video = json["video"];
    voteAverage = json["vote_average"].toDouble();
    voteCount = json["vote_count"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["adult"] = adult;
    map["backdrop_path"] = backdropPath;
    if (belongsToCollection != null) {
      map["belongs_to_collection"] = belongsToCollection?.toJson();
    }
    map["budget"] = budget;
    if (genres != null) {
      map["genres"] = genres?.map((v) => v.toJson()).toList();
    }
    map["homepage"] = homepage;
    map["id"] = id;
    map["imdb_id"] = imdbId;
    map["original_language"] = originalLanguage;
    map["original_title"] = originalTitle;
    map["overview"] = overview;
    map["popularity"] = popularity;
    map["poster_path"] = posterPath;
    if (productionCompanies != null) {
      map["production_companies"] = productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map["production_countries"] = productionCountries?.map((v) => v.toJson()).toList();
    }
    map["release_date"] = releaseDate;
    map["revenue"] = revenue;
    map["runtime"] = runtime;
    if (spokenLanguages != null) {
      map["spoken_languages"] = spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map["status"] = status;
    map["tagline"] = tagline;
    map["title"] = title;
    map["video"] = video;
    map["vote_average"] = voteAverage;
    map["vote_count"] = voteCount;
    return map;
  }
}
