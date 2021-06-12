import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:space_survival/Utils/util.dart';

class CustomWidget {
  static Widget backButton(BuildContext context, Routes route, double coin,
      {bool isRemovePreviousBackStack = false}) {
    return Container(
      // alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
              style: CustomWidget.flatButtonStyle,
              onPressed: () {
                Nav.route(context, route, null,
                    isRemovePreviousBackStack: isRemovePreviousBackStack);
              },
              icon: Icon(Icons.arrow_back),
              label: Text(
                "Back",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
          // FlatButton.icon(
          //     onPressed: () {
          //       Nav.route(context, route, null,
          //           isRemovePreviousBackStack: isRemovePreviousBackStack);
          //     },
          //     icon: Icon(Icons.arrow_back),
          //     label: Text(
          //       "Back",
          //       textAlign: TextAlign.left,
          //       style: TextStyle(fontSize: 20),
          //     )),(Deprecated)
          Text(""),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              new Image.asset(
                "assets/images/coin/coin.gif",
                height: 50.0,
                width: 50.0,
              ),
              Text(
                coin.toString(),
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ]),
          )
        ],
      ),
    );
  }

  static void showToasted(String text, bool isSuccess) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.black,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(),
    shadowColor: null,
  );
}
