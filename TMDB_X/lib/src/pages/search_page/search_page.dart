import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'cubit/search_cubit.dart';
import '../../utils/easy_search.dart';

// IN PROGRESS  (Coming in the end of August)

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => SearchCubit(), child: new _SearchPage());
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
        if (1 == 2) {
          print("stooooooooop,  Oh, no it's ok");
          return Container();
        } else {
          //IMPORTANT
          context.read<SearchCubit>().informInitial();
          print("state is initial --> loadSearch");
          context.read<SearchCubit>().loadSearch();
          return RefreshIndicator(
            child: Scaffold(
              appBar: ScrollAppBar(
                controller: _controller,
                automaticallyImplyLeading: true,
                //backgroundColor: const Color.fromRGBO(16,18,21, 1), // OLD Color
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
              body: Container(
                color: const Color.fromRGBO(36, 42, 50, 1),
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white38,
                )),
              ),
              backgroundColor: Colors.black38,
            ),
            onRefresh: () => context.read<SearchCubit>().reloadSearch(),
          );
        }
      }

      if (state is SearchLoadedState) {
        print("Loading Search");
        return RefreshIndicator(
          child: Scaffold(
            appBar: ScrollAppBar(
              controller: _controller,
              //backgroundColor: const Color.fromRGBO(16,18,21, 1),  // OLD Color
              backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
              actions: [
                Container(
                  color: Color.fromRGBO(36, 42, 50, 1),
                  child: IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: SearchItem(),);
                      },
                      icon: Icon(AntDesign.search1),
                      color: Colors.white),
                )
              ],
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
            body: Container(
              color: Color.fromRGBO(36, 42, 50, 1),
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search),
                label: Text("haha"),
              ),
            ),
            backgroundColor: Colors.black38,
          ),
          onRefresh: () => context.read<SearchCubit>().reloadSearch(),
        );
      }

      if (state is SearchErrorState) {
        // Throw error if state is UserError
        return SearchPage(); //ErrorPage(
        //exceptionPageName: UserTabPage(), errorMessage: state.errorMessage);
      } else
        return Container();
    });
  }
}
