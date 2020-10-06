import 'package:flutter/material.dart';

class TutorialHeaderUI extends StatelessWidget {
  const TutorialHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Tutorial",
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
        ),
      ),
    );
  }
}

class TutorialContentUI extends StatelessWidget {
  const TutorialContentUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis
            .horizontal, //if want to used horizontal layout,need to set width on the
        children: <Widget>[
          tutorialOne(context),
          tutorialTwo(context),
        ],
      ),
    );
  }

  Widget tutorialOne(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.grey.shade300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You are not the pilot!",
                style: TextStyle(
                    fontSize: 25, color: Colors.green.shade800, wordSpacing: 2),
              ),
            )),
            Center(
              child: Text("you are handling a weapon.."),
            ),
            Center(
              child: new Image.asset(
                "assets/images/tutorial/tutorial1.gif",
                height: 400.0,
                width: 450.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tutorialTwo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        color: Colors.grey.shade300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Always Watch Reload Weapon!",
                style: TextStyle(
                    fontSize: 20, color: Colors.green.shade800, wordSpacing: 2),
              ),
            )),
            Center(
              child:
                  Text("not able to use weapon when reload still on going.."),
            ),
            Center(
                child: new Image.asset(
              "assets/images/weapon/reload/reload_weapon.gif",
              height: 400.0,
              width: 550.0,
            ))
          ],
        ),
      ),
    );
  }
}
