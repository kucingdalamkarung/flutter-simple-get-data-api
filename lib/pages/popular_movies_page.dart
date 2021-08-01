import 'package:flutter/material.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/networks/api_service.dart';
import 'package:movie_db/pages/search_page.dart';
import 'package:movie_db/utils/layout.dart';
import 'package:movie_db/widgets/movie_card.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  var _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Popular Movies',
          style: TextStyle(
            color: LayoutUtils.primaryTextColor,
          ),
        ),
        leading: IconButton(
          color: LayoutUtils.primaryTextColor,
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            color: LayoutUtils.primaryTextColor,
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
            },
          )
        ],
      ),
      body: buildPopularMovies(),
    );
  }

  Widget buildPopularMovies() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          List<Movie>? movies = snapshot.data;
          return GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.only(
              top: 5.0,
              left: 5.0,
              right: 5.0,
              bottom: 15.0,
            ),
            childAspectRatio: (130 / 200),
            children: movies!.map((movie) {
              return Container(
                height: 150.0,
                child: MovieCard(movie: movie),
                margin: EdgeInsets.symmetric(horizontal: 2.5, vertical: 5.0),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: _apiService.getPopularMovies(),
    );
  }
}
