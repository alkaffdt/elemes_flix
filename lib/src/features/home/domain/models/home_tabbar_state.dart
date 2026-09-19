import 'package:flutter/material.dart';

class HomeTabbarState {
  const HomeTabbarState({this.controller, this.tabIndex = 0});

  final TabController? controller;
  final int tabIndex;

  HomeTabbarState copyWith({TabController? controller, int? tabIndex}) =>
      HomeTabbarState(
        controller: controller ?? this.controller,
        tabIndex: tabIndex ?? this.tabIndex,
      );
}
