import 'package:flutter/material.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/networks/api_service.dart';
import 'package:movie_db/widgets/movie_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _apiService = ApiService();
  late Future<List<Movie>> _movies;
  var _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _movies = _apiService.getPopularMovies();
    // _searchTextController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(_movies);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              buildSearchBar(context),
              Flexible(
                child: buildPopularMovies(),
              ),
            ],
          ),
        ),
      ),
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
      future: _movies,
    );
  }

  Widget buildSearchBar(context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 19.0),
                child: Container(
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color(0xFFE7E7E7),
                            filled: true,
                            hintText: 'search movie',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none, borderRadius: BorderRadius.circular(5.0)),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                            suffixIcon: Icon(Icons.search),
                          ),
                          controller: _searchTextController,
                          onChanged: (text) {
                            _apiService.searchMovies(text).then((value) => print(value.first.title));
                            setState(() {
                              _movies = _apiService.searchMovies(text.toString());
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
