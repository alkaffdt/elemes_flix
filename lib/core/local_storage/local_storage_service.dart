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
    final rawData = repository.getString(LocalStorageKeys.wishlist);

    if (rawData == null) {
      return [];
    }

    return json
        .decode(rawData)
        .map<MediaItem>((e) => MediaItem.fromJson(e))
        .toList();
  }

  void updateLocalWishlist(List<MediaItem> medias) {
    final currentDatas = json.encode(medias.map((e) => e.toJson()).toList());
    repository.setString(LocalStorageKeys.wishlist, currentDatas);
  }
}
