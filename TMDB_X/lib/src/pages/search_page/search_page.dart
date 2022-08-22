import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../../utils/app_text_theme.dart';
import '../../utils/search_field.dart';
import '../../widgets/search_card.dart';
import '../error_page.dart';
import 'cubit/search_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SearchCubit(), child: const _SearchPage());
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
            title: Text(
              "Search",
              style: AppBarText(),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchField(context),
                SizedBox(
                  height: height / 50,
                  child: Container(),
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    "Here nothing",
                    style: AppBarText()
                        .copyWith(letterSpacing: width / 400, fontSize: 20),
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
            title: Text(
              "Search",
              style: AppBarText(),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchField(context),
                SizedBox(
                  height: height / 50,
                  child: Container(),
                ),
                Expanded(
                  child: state.searchList.isEmpty
                      ? Center(
                          child: Text(
                          "Here nothing",
                          style: AppBarText().copyWith(
                              letterSpacing: width / 400, fontSize: 20),
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
        return ErrorPage(); //ErrorPage in progress
      } else
        return Container();
    });
  }
}
