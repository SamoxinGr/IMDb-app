import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:tmdb_x/src/pages/root_page/root_page.dart';
import '../utils/app_text_theme.dart';

// ignore: must_be_immutable
class ErrorPage extends StatelessWidget {
  final String exPageName;
  const ErrorPage({Key? key, required this.exPageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // handled errors opens dialog box instead new page
    return Scaffold(
      appBar: ScrollAppBar(
        controller: _controller,
        backgroundColor: const Color.fromRGBO(16, 18, 21, 0.97),
        title: Text(
          "Error",
          style: AppBarText(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(36, 42, 50, 1),
      body: Column(
        children: [
          Flexible(flex: 7, child: Container()),
          Flexible(
            flex: 5,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromRGBO(16, 18, 21, 0.97)),
                shadowColor: MaterialStateProperty.all(Colors.black),
                elevation: MaterialStateProperty.all(12),
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                minimumSize:
                    MaterialStateProperty.all(Size(width / 3, height / 10)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              onPressed: () => toPreviousPage(context),
              child: Text(
                "Back",
                style: AppBarText().copyWith(fontSize: 18),
              ),
            ),
          ),
          Flexible(flex: 7, child: Container()),
        ],
      ),
    );
  }

  toPreviousPage(context) {
    if (exPageName == "OpenPage") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => RootPage(pageIndex: 1)));
    }
    if (exPageName == "SearchPage") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => RootPage(pageIndex: 0)));
    }
    if (exPageName == "WatchListPage") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => RootPage(pageIndex: 2)));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => RootPage(
                    pageIndex: 0,
                  )));
    }
  }
}
