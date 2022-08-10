import 'package:flutter/material.dart';
import '../pages/open_page/cubit/open_cubit.dart';
import '../models/MostPopular.dart';

Widget mptvsCard(
    MostPopular item, BuildContext context, OpenLoadedState state) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return Card(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))),
    color: const Color.fromRGBO(36, 42, 50, 1),
    margin: const EdgeInsets.all(5),
    elevation: 5,
    child: Container(
      width: width / 3.3,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          filterQuality: FilterQuality.high,
          image: NetworkImage("${item.image}"),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}