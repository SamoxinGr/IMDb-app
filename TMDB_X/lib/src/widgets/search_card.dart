import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../pages/search_page/cubit/search_cubit.dart';
import '../models/SearchResult.dart';

Widget searchCard(SearchResult item, BuildContext context, SearchLoadedState state) {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;
  return Card(
    color: const Color.fromRGBO(36, 42, 50, 1),
    elevation: 0,
    margin: const EdgeInsets.all(8),
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        //color: Color.fromRGBO(16, 18, 21, 0.95),
        color: Color.fromRGBO(36, 42, 50, 1),
      ),
      height: height / 4,
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: width / 3,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage("${item.image}"),
                          fit: BoxFit.fill)),
                  //child: Image.network("${item.image}"),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Flexible(
                    flex: 4,
                    child: ListTile(
                      title: const Text(
                        "Title:",
                        style: TextStyle(
                            color: Colors.white38,
                            fontSize: 14,
                            letterSpacing: 2,
                            fontFamily: "Kanit",
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black,
                                blurRadius: 10,
                              )
                            ]),
                      ),
                      subtitle: Text("${item.title}",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: "Kanit",
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                )
                              ])),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          //alignment: Alignment.bottomRight,
                          onPressed: () {print("Check");},
                          icon: const Icon(AntDesign.checkcircle)),
                    ),)
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}