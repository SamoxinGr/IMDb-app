import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchItem extends SearchDelegate {



  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(
        color: Color.fromRGBO(36, 42, 50, 1),
        child: IconButton(
            onPressed: () {
              query = '';
            },
            icon: Icon(AntDesign.close)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Container(
      color: Color.fromRGBO(36, 42, 50, 1),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Color.fromRGBO(36, 42, 50, 1),
      child: Expanded(child: Container(color: Color.fromRGBO(36, 42, 50, 1), child: Icon(AntDesign.search1),),)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color.fromRGBO(36, 42, 50, 1),
        child: const Center(
          child: Text(
            "some films etc",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Kanit",
                shadows: <Shadow>[
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                  )
                ]),
          ),
        ),
      ),
    );
  }

  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith();
  }

}
