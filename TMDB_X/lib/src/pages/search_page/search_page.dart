import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../widgets/search_card.dart';
import '../error_page.dart';
import 'cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => SearchCubit(), child: const _SearchPage());
  }
}

class _SearchPage extends StatelessWidget {
  const _SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchInitial) {
        context.read<SearchCubit>().informInitial();
        print("state is initial");
        //context.read<SearchCubit>().loadSearch("");
        return Scaffold(
          appBar: ScrollAppBar(
            controller: _controller,
            //backgroundColor: const Color.fromRGBO(16,18,21, 1),  // OLD Color
            backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
            title: const Text(
              "Search",
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
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onSubmitted: (value) =>
                      context.read<SearchCubit>().loadSearch(value),
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
                      color: const Color.fromRGBO(14, 17, 20, 1),
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      width: width / 300,
                      color: Colors.white38,
                    )),
                    hintText: "Input",
                    hintStyle: TextStyle(
                        color: const Color.fromRGBO(14, 17, 20, 1),
                        fontFamily: "Kanit",
                        fontSize: 20,
                        letterSpacing: width / 400),
                    prefixIcon: const Icon(Feather.search, size: 32),
                    prefixIconColor: const Color.fromRGBO(14, 17, 20, 1),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                  child: Container(),
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    "Here nothing",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Kanit",
                        fontSize: 20,
                        letterSpacing: width / 400),
                  ),
                ))
              ],
            ),
          ),
          backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
        );
      }

      if (state is SearchLoadedState) {
        print("Loading Search");
        return Scaffold(
          appBar: ScrollAppBar(
            controller: _controller,
            //backgroundColor: const Color.fromRGBO(16,18,21, 1),  // OLD Color
            backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
            title: const Text(
              "Search",
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
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                      color: const Color.fromRGBO(14, 17, 20, 1),
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      width: width / 300,
                      color: Colors.white38,
                    )),
                    hintText: "Input",
                    hintStyle: TextStyle(
                        color: const Color.fromRGBO(14, 17, 20, 1),
                        fontFamily: "Kanit",
                        fontSize: 20,
                        letterSpacing: width / 400),
                    prefixIcon: const Icon(Feather.search, size: 32),
                    prefixIconColor: const Color.fromRGBO(14, 17, 20, 1),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                  child: Container(),
                ),
                Expanded(
                  child: state.searchList.isEmpty
                      ? Center(
                          child: Text(
                          "Here nothing",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Kanit",
                              fontSize: 20,
                              letterSpacing: width / 400),
                        ))
                      : ListView.builder(
                          itemCount: state.searchList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () =>
                                  print("Open Page with info in Future"),
                              child: searchCard(
                                  state.searchList[index], context, state),
                            );
                          }),
                )
              ],
            ),
          ),
          backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
        );
      }

      if (state is SearchErrorState) {
        // Throw error if state is UserError
        return ErrorPage(); //ErrorPage in progress
      } else
        return Container();
    });
  }
}
