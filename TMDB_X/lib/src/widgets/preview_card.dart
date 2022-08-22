import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../models/Top250.dart';
import '../pages/open_page/cubit/open_cubit.dart';
import '../utils/app_text_theme.dart';

Widget previewCard(Top250 item, BuildContext context, OpenLoadedState state) {
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
            flex: 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: width / 3.3,
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
                    flex: 2,
                    child: ListTile(
                      title: Text(
                        "Title:",
                        style: HintTextInCard(),
                      ),
                      subtitle: Text("${item.title}",
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: AppBarText().copyWith(fontSize: 18)),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: ListTile(
                            title: Text(
                              "Release:",
                              style: HintTextInCard(),
                            ),
                            subtitle: Text("${item.year}",
                                style: AppBarText().copyWith(fontSize: 18)),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                alignment: Alignment.bottomRight,
                                onPressed: () {print("Check");},
                                icon: const Icon(AntDesign.checkcircle)),
                          ),)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                            "IMDB: ",
                            textAlign: TextAlign.left,
                            style: HintTextInCard(),
                          ),
                          subtitle: Text("${item.imdbrating}",
                              textAlign: TextAlign.left,
                              style: AppBarText().copyWith(fontSize: 18)),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: ListTile(
                          title: Text(
                            "Rank:",
                            textAlign: TextAlign.right,
                            style: HintTextInCard(),
                          ),
                          subtitle: Text("${item.rank}",
                              textAlign: TextAlign.right,
                              style: AppBarText().copyWith(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
