import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tour/common/theme.dart';
import 'package:tour/screen/home_screen.dart';

void main() => runApp(HotelConceptApp());

class HotelConceptApp extends StatefulWidget {
  @override
  _HotelConceptAppState createState() => _HotelConceptAppState();
}

class _HotelConceptAppState extends State<HotelConceptApp>
    with TickerProviderStateMixin {
  TabController _controller;
  final List<Widget> tabBarScreens = [
    HomeScreen(),
    Container(color: Colors.lightBlueAccent),
    Container(color: Colors.lightBlue),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        initialIndex: 0,
        length: tabBarScreens.length,
        vsync: this
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withAlpha(50),
        statusBarIconBrightness: Brightness.light));
    final themeData = HotelConceptThemeProvider.get();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Africa Tour',
      theme: themeData,
      home: Scaffold(
        backgroundColor: themeData.scaffoldBackgroundColor,
        body: TabBarView(
          controller: _controller,
          children: tabBarScreens,
          physics: NeverScrollableScrollPhysics(),
        ),
//        bottomNavigationBar: TabBar(
//          controller: _controller,
//          indicatorSize: TabBarIndicatorSize.label,
//          indicatorColor: Colors.transparent,
//          isScrollable: false,
//          tabs: [
//            _buildTabIcon("img/tab_bar_home.svg", 0, themeData),
//            _buildTabIcon("img/tab_bar_messages.svg", 1, themeData),
//            //_buildTabIcon("img/tab_bar_search.svg", 2, themeData),
//            //_buildTabIcon("img/tab_bar_notifications.svg", 3, themeData),
//            _buildTabIcon("img/tab_bar_profile.svg", 1, themeData),
//          ],
//          onTap: (index) {
//            setState(() {
//              //initialIndex = index;
//            });
//          },
//        ),
      ),
    );
  }

  Widget _buildTabIcon(String assetName, int index, ThemeData themeData) {
    return Tab(
      icon: SvgPicture.asset(
        assetName,
        color: index == _controller.index
            ? themeData.accentColor
            : themeData.primaryColorLight,
      ),
    );
  }
}
