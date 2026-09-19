import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistControllerProvider =
    StateNotifierProvider<WishlistController, List<MediaItem>>((ref) {
      return WishlistController();
    });

class WishlistController extends StateNotifier<List<MediaItem>> {
  WishlistController() : super([]);

  void add(MediaItem item) {
    state = [...state, item];
  }

  void remove(int id) {
    state = state.where((element) => element.id != id).toList();
  }

  bool isBookmarked(int id) {
    return state.any((element) => element.id == id);
  }
}
