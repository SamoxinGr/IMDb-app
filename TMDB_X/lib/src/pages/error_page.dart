import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../utils/app_text_theme.dart';

// WITHOUT DECORATION
// ignore: must_be_immutable
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // handled errors opens dialog box instead new page
    return Scaffold(
      appBar: ScrollAppBar(
        controller: _controller,
        //backgroundColor: const Color.fromRGBO(16,18,21, 1),  // OLD Color
        backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
        title: Text(
          "Error",
          style: AppBarText(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(36, 42, 50, 1),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Back"),
        ),
      ),
    );
  }
}
