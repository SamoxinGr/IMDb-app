import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/app_text_theme.dart';
import '../error_page.dart';
import 'cubit/movie_cubit.dart';

class MoviePage extends StatelessWidget {
  final String id;
  const MoviePage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MovieCubit(id),
        child: _MoviePage(
          id: id,
        ));
  }
}

class _MoviePage extends StatelessWidget {
  final String id;
  const _MoviePage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
      if (state is MovieInitial) {
        context.read<MovieCubit>().informInitial();
        context.read<MovieCubit>().loadMovie(id);
        print("state is initial");
        return Scaffold(
          backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color.fromRGBO(16, 18, 21, 0.97),
                leading: IconButton(
                    icon: Icon(
                      CupertinoIcons.back,
                      size: height / 22,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                expandedHeight: height / 1.26,
                floating: false,
                pinned: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(16, 18, 21, 0.97),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32))),
                    //color: Color.fromRGBO(16, 18, 21, 0.97),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: height / 1.08,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: TabBar(
                                indicatorColor: Colors.white,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "About",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppBarText().copyWith(fontSize: 18),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Cast",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppBarText().copyWith(fontSize: 18),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Similars",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppBarText().copyWith(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [Container(), Container(), Container()],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      if (state is MovieLoadedState) {
        context.read<MovieCubit>().informInitial();
        print("state is initial");
        return Scaffold(
          backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color.fromRGBO(16, 18, 21, 0.97),
                leading: IconButton(
                    icon: Icon(
                      CupertinoIcons.back,
                      size: height / 22,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                expandedHeight: height / 1.26,
                floating: false,
                pinned: true,
                title: Text(
                  "${state.detailList[0].title}",
                  style: AppBarText(),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                centerTitle: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                      image: DecorationImage(
                        filterQuality: FilterQuality.high,
                        image: NetworkImage("${state.detailList[0].image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: height / 1.1,
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
                      appBar: AppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: const Color.fromRGBO(36, 42, 50, 1),
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: TabBar(
                                isScrollable: false,
                                indicatorWeight: 8,
                                indicatorColor: Colors.white,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "About",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppBarText().copyWith(fontSize: 18),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Cast",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppBarText().copyWith(fontSize: 18),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Similars",
                                      textAlign: TextAlign.center,
                                      style:
                                          AppBarText().copyWith(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              height: height * 0.8,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                            // 1
                                            flex: 2,
                                            child: ListTile(
                                              title: Text(
                                                "Type",
                                                style: HintTextInCard(),
                                              ),
                                              subtitle: Text(
                                                  "${state.detailList[0].type}",
                                                  style: AppBarText()
                                                      .copyWith(fontSize: 18)),
                                            )),
                                        Flexible(
                                            //2
                                            flex: 2,
                                            child: ListTile(
                                              title: Text(
                                                "Relise",
                                                style: HintTextInCard(),
                                                textAlign: TextAlign.right,
                                              ),
                                              subtitle: Text(
                                                "${state.detailList[0].releaseDate}",
                                                style: AppBarText()
                                                    .copyWith(fontSize: 18),
                                                textAlign: TextAlign.right,
                                              ),
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            flex: 2,
                                            child: ListTile(
                                              title: Text(
                                                "Time",
                                                style: HintTextInCard(),
                                              ),
                                              subtitle: Text(
                                                  "${state.detailList[0].runtimeStr}",
                                                  style: AppBarText()
                                                      .copyWith(fontSize: 18)),
                                            )),
                                        Flexible(
                                            flex: 2,
                                            child: ListTile(
                                              title: Text(
                                                "Content Rating",
                                                style: HintTextInCard(),
                                                textAlign: TextAlign.right,
                                              ),
                                              subtitle: Text(
                                                "${state.detailList[0].contentRating}",
                                                style: AppBarText()
                                                    .copyWith(fontSize: 18),
                                                textAlign: TextAlign.right,
                                              ),
                                            )),
                                      ],
                                    ),
                                    Flexible(
                                        //4
                                        flex: 2,
                                        child: ListTile(
                                          title: Text(
                                            "Genre",
                                            style: HintTextInCard(),
                                          ),
                                          subtitle: Text(
                                              "${state.detailList[0].genre}",
                                              style: AppBarText()
                                                  .copyWith(fontSize: 18)),
                                        )),
                                    Row(
                                      children: [
                                        Flexible(
                                            // 1
                                            flex: 2,
                                            child: ListTile(
                                              title: Text(
                                                "IMDb",
                                                style: HintTextInCard(),
                                              ),
                                              subtitle: Text(
                                                  "${state.detailList[0].imDbRating}",
                                                  style: AppBarText()
                                                      .copyWith(fontSize: 18)),
                                            )),
                                        Flexible(
                                            //2
                                            flex: 2,
                                            child: ListTile(
                                              title: Text(
                                                "MetaCritic",
                                                style: HintTextInCard(),
                                                textAlign: TextAlign.right,
                                              ),
                                              subtitle: Text(
                                                "${state.detailList[0].metacriticRating}",
                                                style: AppBarText()
                                                    .copyWith(fontSize: 18),
                                                textAlign: TextAlign.right,
                                              ),
                                            )),
                                      ],
                                    ),
                                    ListTile(
                                      title: Text(
                                        "Plot",
                                        style: HintTextInCard(),
                                      ),
                                      subtitle: Text(
                                          "${state.detailList[0].plot}",
                                          style: AppBarText()
                                              .copyWith(fontSize: 18)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(),
                          Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      if (state is MovieErrorState) {
        return const ErrorPage(
            exPageName: "SearchPage"); //ErrorPage in progress
      } else {
        return Container();
      }
    });
  }
}
