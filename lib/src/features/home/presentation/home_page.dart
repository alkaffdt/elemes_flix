import 'package:elemes_flix/src/features/home/presentation/movie_card.dart';
import 'package:elemes_flix/src/features/home/presentation/now_playing_view.dart';
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
          _Tabbar(),
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
    return NowPlayingView();
  }
}

class _Tabbar extends StatefulWidget {
  const _Tabbar({super.key});

  @override
  State<_Tabbar> createState() => __TabbarState();
}

class __TabbarState extends State<_Tabbar> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        controller: _tabController,
        tabAlignment: TabAlignment.start,
        indicatorColor: AppColors.primary,
        indicatorWeight: 5,
        dividerColor: AppColors.primary,
        tabs: [
          Tab(text: 'Top Movies'),
          Tab(text: 'Top TV Shows'),
          Tab(text: 'Popular Movies'),
          Tab(text: 'Popular TV Shows'),
        ],
      ),
    );
  }
}
