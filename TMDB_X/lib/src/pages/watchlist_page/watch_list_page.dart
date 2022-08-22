import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../../utils/app_text_theme.dart';
import 'cubit/watch_list_cubit.dart';

// IN PROGRESS (coming in the end of September)

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => WatchListCubit(),
        child: new _WatchListPage()
    );
  }
}

class _WatchListPage extends StatelessWidget {
  const _WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<WatchListCubit, WatchListState>(builder: (context, state) {
      if (state is WatchListInitial) {
        if (1 == 2) {
          print("stooooooooop,  Oh, no it's ok");
          return Container();
        }
        else {         //IMPORTANT
          context.read<WatchListCubit>().informInitial();
          print("state is initial --> loadSearch");
          context.read<WatchListCubit>().loadWatchList();
          return RefreshIndicator(
            child: Scaffold(
              appBar: ScrollAppBar(
                controller: _controller,
                automaticallyImplyLeading: true,
                //backgroundColor: const Color.fromRGBO(16,18,21, 1), // OLD Color
                backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
                title: Text(
                  "WatchList",
                  style: AppBarText(),
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
            onRefresh: () => context.read<WatchListCubit>().reloadWatchList(),
          );
        }
      }

      if (state is WatchListLoadedState) {
        print("Loading WatchList");
        return RefreshIndicator(
          child: Scaffold(
            appBar: ScrollAppBar(
              controller: _controller,
              //backgroundColor: const Color.fromRGBO(16,18,21, 1),  // OLD Color
              backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
              title: Text(
                "WatchList",
                style: AppBarText(),
              ),
              centerTitle: true,
            ),
            body: Container(
              color: Color.fromRGBO(36, 42, 50, 1),
              child: SingleChildScrollView(
                child: Container(),
              ),
            ),
            backgroundColor: Colors.black38,
          ),
          onRefresh: () => context.read<WatchListCubit>().reloadWatchList(),
        );
      }

      if (state is WatchListErrorState) { // Throw error if state is UserError
        return WatchListPage(); //ErrorPage(
        //exceptionPageName: UserTabPage(), errorMessage: state.errorMessage);
      }

      else
        return Container();
    }
    );
  }
}