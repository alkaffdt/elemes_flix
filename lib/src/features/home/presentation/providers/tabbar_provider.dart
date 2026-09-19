import 'package:elemes_flix/src/features/home/domain/models/home_tabbar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeTabbarProvider =
    StateNotifierProvider<HomeTabbarNotifierProvider, HomeTabbarState>((ref) {
      return HomeTabbarNotifierProvider();
    });

class HomeTabbarNotifierProvider extends StateNotifier<HomeTabbarState> {
  HomeTabbarNotifierProvider() : super(const HomeTabbarState());

  void vInitTabbar(TickerProvider vsync) {
    Future.delayed(const Duration(milliseconds: 100), () {
      state = state.copyWith(
        controller: TabController(length: 4, vsync: vsync),
      );
    });
  }

  void vChangeTabIndex(int index) {
    state.controller?.animateTo(index);
    state = state.copyWith(tabIndex: index);
  }

  @override
  dispose() {
    super.dispose();
    state.controller?.dispose();
  }
}
