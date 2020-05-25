
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_survival/Utils/util.dart';

class CustomWidget{

  static Widget backButton(BuildContext context,Routes route,{bool isRemovePreviousBackStack = false}){
    return Container(
      // alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton.icon(onPressed: (){
              Nav.route(context,route,null,isRemovePreviousBackStack:isRemovePreviousBackStack);
          }, icon: Icon(Icons.arrow_back ), label: Text("Back", textAlign: TextAlign.left,style: TextStyle(fontSize: 20),)),
          Text(""),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              
              children:[
                new Image.asset(
                    "assets/images/coin/coin.gif",
                    height: 50.0,
                    width: 50.0,
                  ),
                  Text("100,000",style: TextStyle(color: Colors.black,fontSize: 20),),
              ]
            ),
          )
        ],
      ),
    );
  }
}