import 'package:elemes_flix/core/local_storage/local_storage_service.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wishlistControllerProvider =
    StateNotifierProvider<WishlistController, List<MediaItem>>((ref) {
      return WishlistController(
        localStorageService: ref.read(localStorageServiceProvider),
      );
    });

class WishlistController extends StateNotifier<List<MediaItem>> {
  WishlistController({required this.localStorageService}) : super([]) {
    state = localStorageService.getWishlist();
  }

  final LocalStorageService localStorageService;

  void addMedia(MediaItem item) {
    state = [...state, item];
    localStorageService.addWishlist(item);
  }

  void removeMedia(int id) {
    state = state.where((element) => element.id != id).toList();
    localStorageService.removeWishlist(id);
  }

  bool isBookmarked(int id) {
    return state.any((element) => element.id == id);
  }
}
