import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:elemes_flix/extensions/int_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elemes Flix')),
      body: Column(children: [20.toHeightGap(), _Tabbar()]),
    );
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
        indicatorPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        controller: _tabController,
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
