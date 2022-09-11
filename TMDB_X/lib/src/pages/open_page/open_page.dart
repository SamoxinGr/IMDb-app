import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../../utils/app_text_theme.dart';
import '../error_page.dart';
import 'cubit/open_cubit.dart';
import '../../widgets/most_popular_movie_card.dart';
import '../../widgets/most_popular_tvs_card.dart';
import '../../widgets/preview_card.dart';
import '../../widgets/preview_card_releases.dart';
import '../../widgets/preview_card_box.dart';

class OpenPage extends StatelessWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => OpenCubit(), child: const _OpenPage());
  }
}

class _OpenPage extends StatelessWidget {
  const _OpenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<OpenCubit, OpenState>(builder: (context, state) {
      if (state is OpenInitial) {
        if (1 == 2) {
          print("rofl if else");
          return Container();
        } else {
          //IMPORTANT      rework in future
          print("state is initial --> loadOpen");
          context.read<OpenCubit>().loadOpen();
          return RefreshIndicator(
            color: const Color.fromRGBO(36, 42, 50, 1),
            child: Scaffold(
              appBar: ScrollAppBar(
                controller: _controller,
                automaticallyImplyLeading: true,
                //backgroundColor: const Color.fromRGBO(16,18,21, 1), // OLD Color
                backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
                title: Text(
                  "Hi, dude!",
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
            onRefresh: () => context.read<OpenCubit>().reloadUser(),
          );
        }
      }

      if (state is OpenLoadedState) {
        print("Loading Open");
        return RefreshIndicator(
          backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
          color: Colors.white,
          strokeWidth: height / 300,
          child: Scaffold(
            appBar: ScrollAppBar(
              controller: _controller,
              //backgroundColor: const Color.fromRGBO(16,18,21, 1),  // OLD Color
              backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
              title: Text(
                "Hi, dude!",
                style: AppBarText(),
              ),
              centerTitle: true,
            ),
            body: Container(
              color: const Color.fromRGBO(36, 42, 50, 1),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _controller,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      color: const Color.fromRGBO(36, 42, 50, 1),
                      height: height / 20,
                      child: Text(
                        "Most Popular Movies today:",
                        style: AppBarText().copyWith(fontSize: 20),
                      ),
                    ),
                    Container(
                      height: height / 4,
                      child: ListView.builder(
                          // Movies wheel
                          shrinkWrap: true,
                          itemCount: state.mpmList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () => print("Open MoviePage in Future"),
                                child: mpmCard(
                                    state.mpmList[index], context, state));
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      color: const Color.fromRGBO(36, 42, 50, 1),
                      height: height / 20,
                      child: Text(
                        "Also Most Popular TVs:",
                        style: AppBarText().copyWith(fontSize: 20),
                      ),
                    ),
                    Container(
                      height: height / 4,
                      child: ListView.builder(
                          // TVs wheel
                          shrinkWrap: true,
                          itemCount: state.mptvsList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () => print("Open TVsPage in Future"),
                                child: mptvsCard(
                                    state.mptvsList[index], context, state));
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      color: const Color.fromRGBO(36, 42, 50, 1),
                      height: height / 18,
                      child: Text(
                        "Here more:",
                        style: AppBarText().copyWith(fontSize: 20),
                      ),
                    ),
                    Container(
                      height: height / 1.1,
                      child: DefaultTabController(
                        length: 4,
                        child: Scaffold(
                          backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
                          appBar: AppBar(
                            backgroundColor:
                                const Color.fromRGBO(36, 42, 50, 1),
                            flexibleSpace: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  //color: Color.fromRGBO(36, 42, 50, 1),
                                  child: TabBar(
                                      indicatorColor: Colors.white,
                                      tabs: [
                                        Tab(
                                          child: Text(
                                            "250 Movies",
                                            textAlign: TextAlign.center,
                                            style: AppBarText(),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            "250 TVs",
                                            textAlign: TextAlign.center,
                                            style: AppBarText(),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            "In Theaters",
                                            textAlign: TextAlign.center,
                                            style: AppBarText(),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            "Best BoxOffice",
                                            textAlign: TextAlign.center,
                                            style: AppBarText(),
                                          ),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          ),
                          body: TabBarView(
                            children: [
                              Container(
                                color: const Color.fromRGBO(36, 42, 50, 1),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.movtopList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () =>
                                            print("Open Movie Page in Future"),
                                        child: previewCard(
                                            state.movtopList[index],
                                            context,
                                            state));
                                  },
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.tvstopList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () =>
                                            print("Open TVsPage in Future"),
                                        child: previewCard(
                                            state.tvstopList[index],
                                            context,
                                            state));
                                  },
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.theaterList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () =>
                                            print("Open TVsPage in Future"),
                                        child: preview_releaseCard(
                                            state.theaterList[index],
                                            context,
                                            state));
                                  },
                                ),
                              ),
                              Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.boxList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        onTap: () => print("Picture in Future"),
                                        child: preview_boxCard(
                                            state.boxList[index],
                                            context,
                                            state));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
          ),
          onRefresh: () => context.read<OpenCubit>().reloadUser(),
        );
      }

      if (state is OpenErrorState) {
        // Throw error if state is UserError
        return const ErrorPage(exPageName: "OpenPage");
      } else {
        return Container();
      }
    });
  }
}
