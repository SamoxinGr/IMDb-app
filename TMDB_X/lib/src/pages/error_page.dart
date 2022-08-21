import 'package:flutter/material.dart';


// WITHOUT DECORATION
// ignore: must_be_immutable
class ErrorPage extends StatelessWidget {

  ErrorPage(
      {Key? key})
      :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // handled errors opens dialog box instead new page
    if ("_errorMessage".contains("NoSuchMethodError: The method '[]' was called on null")) {
      return Scaffold(body: Container(child: Center(child: Text("Error"),),),);
    }
    if ("{_errorMessage".contains(
        "Failed User Load Exception: Failed to get USER")) {
      return Scaffold(body: Container(child: Center(child: Text("Error"),),),);
    }
    // else any other errors opens error dialog box
    return Scaffold(body: Container(child: Center(child: Text("Error"),),),);
  }
}