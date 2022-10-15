import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../pages/search_page/cubit/search_cubit.dart';

Widget searchField(BuildContext context) {
  ScrollController _controller = new ScrollController();
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return TextField(
    cursorWidth: 1,
    cursorColor: Colors.white38,
    onSubmitted: (value) => context.read<SearchCubit>().loadSearch(value),
    style: TextStyle(
        color: Colors.white70,
        fontFamily: "Kanit",
        fontSize: 20,
        letterSpacing: width / 400),
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color.fromRGBO(36, 42, 50, 1),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        width: width / 300,
        color: Colors.white,
        //color: const Color.fromRGBO(14, 17, 20, 1),
      )),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
        width: width / 300,
        color: Colors.white38,
      )),
      hintText: "Input title",
      hintStyle: TextStyle(
          color: Colors.white,
          fontFamily: "Kanit",
          fontSize: 20,
          letterSpacing: width / 400),
      prefixIcon: const Icon(
        Feather.search,
        size: 24,
        color: Colors.white,
      ),
      prefixIconColor: const Color.fromRGBO(14, 17, 20, 1),
    ),
  );
}
