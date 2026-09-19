import 'dart:convert';

import 'package:elemes_flix/core/local_storage/shared_pref_repo.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class WishlistDataSource {
  List<MediaItem> getWishlist();
  void addWishlist(String content);
  void removeWishlist(int id);
}

final wishlistDataSourceProvider = Provider<WishlistDataSource>((ref) {
  return WishlistDataSourceImpl(ref.read(sharedPreferencesRepositoryProvider));
});

class WishlistDataSourceImpl implements WishlistDataSource {
  final SharedPreferencesRepository sharedPreferencesRepository;

  WishlistDataSourceImpl(this.sharedPreferencesRepository);

  @override
  List<MediaItem> getWishlist() {
    final wishlist = sharedPreferencesRepository.getStringList('wishlist');

    return wishlist
        .map((data) => MediaItem.fromJson(json.decode(data)))
        .toList();
  }

  @override
  void addWishlist(String content) {
    throw UnimplementedError();
  }

  @override
  void removeWishlist(int id) {
    throw UnimplementedError();
  }
}
