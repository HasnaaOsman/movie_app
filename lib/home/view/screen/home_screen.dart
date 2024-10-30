import 'package:flutter/material.dart';

import '../../../browse/view/widgets/Browse.dart';
import '../../../home_datails/view/widgets/home_details.dart';
import '../../../search/view/widgets/search.dart';
import '../../../watchlist/view/widgets/watchlist.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'x1';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeDetails(),
    const Search(),
    const Browse(),
    const Watchlist(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.house_rounded,
              size: 33,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(
              Icons.search_outlined,
              size: 33,
            ),
          ),
          BottomNavigationBarItem(
            label: "Browse",
            icon: Icon(
              Icons.movie_creation,
              size: 33,
            ),
          ),
          BottomNavigationBarItem(
            label: "WatchList",
            icon: Icon(
              Icons.collections_bookmark_sharp,
              size: 33,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
    );
  }
}
