import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:movie_db/models/movie.dart';
import 'package:movie_db/utils/constants.dart';

class MovieCard extends StatelessWidget {
  Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var snackbar = SnackBar(
          content: Text(movie.title ?? '-'),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: Container(
        margin: EdgeInsets.only(top: 0, left: 2.5, right: 5.0, bottom: 0.0),
        height: 200.0,
        width: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: Colors.amber,
          image: (movie.posterPath == '' || movie.posterPath == null)
              ? DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: NetworkImage('${Constants.IMAGE_URL}/w500/${movie.posterPath}'),
                  fit: BoxFit.cover,
                ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: Padding(
              child: Text(
                movie.title ?? '-',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.all(5.0),
            ),
          ),
        ),
      ),
    );
  }
}
