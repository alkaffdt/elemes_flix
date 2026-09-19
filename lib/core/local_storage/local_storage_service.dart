import 'dart:convert';

import 'package:elemes_flix/core/local_storage/local_storage_keys.dart';
import 'package:elemes_flix/core/local_storage/shared_pref_repo.dart';
import 'package:elemes_flix/src/features/home/domain/models/media_item_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService(
    repository: ref.watch(sharedPreferencesRepositoryProvider),
  );
});

class LocalStorageService {
  final SharedPreferencesRepository repository;

  LocalStorageService({required this.repository});

  List<MediaItem> getWishlist() {
    final rawData = repository.getStringList(LocalStorageKeys.wishlist);
    return rawData.map((e) => MediaItem.fromJson(json.decode(e))).toList();
  }

  void addWishlist(MediaItem media) {
    final currentWishlist = repository.getStringList(LocalStorageKeys.wishlist);
    currentWishlist.add(media.toJson().toString());
    //
    repository.setStringList(LocalStorageKeys.wishlist, currentWishlist);
  }

  void removeWishlist(int id) {
    final currentWishlist = repository.getStringList(LocalStorageKeys.wishlist);
    currentWishlist.removeWhere(
      (element) => MediaItem.fromJson(json.decode(element)).id == id,
    );
    //
    repository.setStringList(LocalStorageKeys.wishlist, currentWishlist);
  }
}
