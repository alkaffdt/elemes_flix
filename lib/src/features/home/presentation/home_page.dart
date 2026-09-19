import 'package:elemes_flix/src/features/home/presentation/home_tabbar.dart';
import 'package:elemes_flix/src/features/home/presentation/movie_card.dart';
import 'package:elemes_flix/src/features/home/presentation/now_playing_view.dart';
import 'package:elemes_flix/src/features/home/presentation/providers/tabbar_provider.dart';
import 'package:elemes_flix/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:elemes_flix/extensions/int_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elemes Flix')),
      body: Column(
        children: [
          20.toHeightGap(),
          HomeTabbarMenu(),
          16.toHeightGap(),
          Expanded(child: _Body()),
        ],
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(homeTabbarProvider).tabIndex;

    switch (tabIndex) {
      case 0:
        return NowPlayingView();
      case 1:
        return Container();

      default:
        return Container();
    }
  }
}
