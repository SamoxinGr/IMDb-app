import 'package:flutter/material.dart';
import 'package:tmdb_x/src/models/MostPopularTVs.dart';
import 'package:tmdb_x/src/pages/open_page/cubit/open_cubit.dart';

Widget mptvsCard(
    MostPopularTVs item, BuildContext context, OpenLoadedState state) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15))),
    color: Color.fromRGBO(36, 42, 50, 1),
    margin: EdgeInsets.all(5),
    elevation: 5,
    child: Container(
      width: width / 3.5,
      //height: height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: NetworkImage("${item.image}"),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}