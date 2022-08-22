import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../open_page/open_page.dart';
import '../search_page/search_page.dart';
import '../watchlist_page/watch_list_page.dart';

// ignore: must_be_immutable
class RootPage extends StatefulWidget {
  int? _pageIndex;
  RootPage({Key? key, int? pageIndex})
      : _pageIndex = pageIndex,
        super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<RootPage> createState() => _RootPageState(_pageIndex);
}

class _RootPageState extends State<RootPage> {
  int _pageIndex;
  _RootPageState(pageIndex) : _pageIndex = pageIndex;
  GlobalKey bottomNavigationKey = GlobalKey();
  List<Widget> pageList = <Widget>[
    const SearchPage(),
    const OpenPage(),
    const WatchListPage()
  ];
  @override
  Widget build(BuildContext context) {
    if (_pageIndex == null) {
      _pageIndex = 0;
    } // default page is OpenPage
    return Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
        body: pageList.elementAt(_pageIndex),
        bottomNavigationBar: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: Colors.grey[600],
          backgroundColor: const Color.fromRGBO(0, 0, 1, 1),
          borderRadius: const Radius.circular(20.0),
          blurEffect: true,
          opacity: 0.8,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(
                AntDesign.search1,
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                Feather.film,
              ),
            ),
            CustomNavigationBarItem(
              icon: const Icon(
                AntDesign.book,
              ),
            ),
          ],
          currentIndex: _pageIndex,
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          isFloating: true,
        ));
  }
}
