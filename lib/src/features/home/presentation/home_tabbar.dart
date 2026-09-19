import 'package:elemes_flix/src/features/home/presentation/providers/tabbar_provider.dart';
import 'package:elemes_flix/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeTabbarMenu extends ConsumerStatefulWidget {
  const HomeTabbarMenu({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __TabbarState();
}

class __TabbarState extends ConsumerState<HomeTabbarMenu>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    ref.read(homeTabbarProvider.notifier).vInitTabbar(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabbarController = ref.watch(homeTabbarProvider).controller;

    // show loading indicator while tab controller is being initialized
    if (tabbarController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 50,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        controller: tabbarController,
        tabAlignment: TabAlignment.start,
        indicatorColor: AppColors.primary,
        indicatorWeight: 5,
        dividerColor: AppColors.primary,
        onTap: (index) {
          ref.read(homeTabbarProvider.notifier).vChangeTabIndex(index);
        },
        tabs: [
          Tab(text: 'Now Playing Movies'),
          Tab(text: 'Popular Movies'),
          Tab(text: 'Airing TV Shows'),
          Tab(text: 'Popular TV Shows'),
        ],
      ),
    );
  }
}
