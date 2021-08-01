import 'package:flutter/material.dart';
import 'package:movie_db/models/genres.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/networks/api_service.dart';
import 'package:movie_db/pages/popular_movies_page.dart';
import 'package:movie_db/utils/layout.dart';
import 'package:movie_db/widgets/genre_card.dart';
import 'package:movie_db/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 15.0),
            child: Column(
              children: [
                buildHeader(),
                buildPopularMovie(),
                buildPopularMovie(),
                buildGenres(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// create widget for header
  Widget buildHeader() {
    return Container(
      child: Padding(
        padding: LayoutUtils.layoutPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Your Favorite ',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: LayoutUtils.fontFamily,
                      color: LayoutUtils.primaryTextColor,
                    ),
                  ),
                  Text(
                    'Movie Information',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: LayoutUtils.fontFamily,
                      color: LayoutUtils.accentTextColor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// create widget to show movie genres data
  Widget buildGenres() {
    return Padding(
      padding: LayoutUtils.layoutPadding,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Movie Genres'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: LayoutUtils.fontFamily,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PopularMoviesPage()));
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: LayoutUtils.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              future: _apiService.getMovieGenres(),
              builder: (context, AsyncSnapshot<List<Genre>> snapshot) {
                if (snapshot.hasData) {
                  Iterable<Genre> genres = snapshot.data!.take(6).cast<Genre>();
                  return GridView.count(
                    childAspectRatio: (20.0 / 10.0),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: genres.map((Genre genre) => GenreCard(genre: genre)).toList(),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// create widget to show popular movie data
  Widget buildPopularMovie() {
    return Padding(
      padding: LayoutUtils.layoutPadding,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular movies'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: LayoutUtils.fontFamily,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PopularMoviesPage()));
                    },
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: LayoutUtils.fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
              builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.hasData) {
                  Iterable<Movie> movies = snapshot.data!.take(10).cast<Movie>();
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: movies.map((movie) => MovieCard(movie: movie)).toList(),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              future: _apiService.getPopularMovies(),
            ),
          ],
        ),
      ),
    );
  }
}
