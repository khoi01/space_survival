import 'package:flutter/material.dart';
import 'package:space_survival/Utils/util.dart';



class MainTopUI extends StatelessWidget {
  const MainTopUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Container(
            child: Text("High Score: 10",
            style: TextStyle(fontSize: 20),
            )
          ),
           Container(
             child: Row(children: [
                  new Image.asset(
                    "assets/images/coin/coin.gif",
                    height: 50.0,
                    width: 50.0,
                  ),
                  Text("100,000",style: TextStyle(color: Colors.black,fontSize: 20),)
             ],),
           )
        ]
      ),
    );
  }
}


class MainHeaderUI extends StatelessWidget {
  const MainHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Image.asset(
                    "assets/images/title/game_header.gif",
                    height: 200.0,
                    width: 250.0,
                  )
      ),
    );
  }
}





class MainMenuUI extends StatelessWidget {
  const MainMenuUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            RaisedButton(child: Text("Start Game",style: TextStyle(fontSize: AppConfig.textBtnSize),),
            onPressed: () {
              Nav.route(context,Routes.main_game,null);
            },)
            ,
            RaisedButton(child: Text("Tutorial",style: TextStyle(fontSize: AppConfig.textBtnSize)),
            onPressed: () {
              Nav.route(context,Routes.tutorial_page,null);
            },)
            ,
            RaisedButton(child: Text("Scoreboard",style: TextStyle(fontSize: AppConfig.textBtnSize)),
            onPressed: () {
              Nav.route(context,Routes.scoreboard_page,null);
            },)
            // ,
            // RaisedButton(child: Text("Garage",style: TextStyle(fontSize: AppConfig.textBtnSize)),
            // onPressed: () {
            //   Nav.route(context,Routes.garage_page,null);
            // },)
            ,
            RaisedButton(child: Text("Store",style: TextStyle(fontSize: AppConfig.textBtnSize)),
            onPressed: () {
              Nav.route(context,Routes.store_page,null);
            },)
            ,
            RaisedButton(child: Text("Credit",style: TextStyle(fontSize: AppConfig.textBtnSize)),
            onPressed: () {
              Nav.route(context,Routes.credits_page,null);
            },)
          ],
        ),
    );
  }
}