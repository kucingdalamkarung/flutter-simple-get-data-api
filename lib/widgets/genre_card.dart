import 'package:flutter/material.dart';
import 'package:movie_db/models/genres.dart';

class GenreCard extends StatelessWidget {
  Genre genre;

  GenreCard({required this.genre});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: Color(0xFF686868),
        ),
        child: Center(
          child: Text(
            '${genre.name}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
