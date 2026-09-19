import 'package:elemes_flix/config/api_config.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, {super.key});

  final MediaItem movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: Card(
        child: Stack(
          children: [
            Image.network(AppApiConfig.imagePrefixUrl + movie.posterPath!),
            // Text('Movie'),
          ],
        ),
      ),
    );
  }
}
