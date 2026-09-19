import 'package:elemes_flix/src/features/home/data/repos/home_repository_impl.dart';
import 'package:elemes_flix/src/features/home/domain/models/movie_model.dart';
import 'package:elemes_flix/src/features/home/domain/repos/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMovieProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.read(homeRepositoryProvider).getNowPlayingMovies();
});
