import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:space_survival/route/MainPage/MainPage.dart';

class SplashScreenGame extends StatefulWidget {
  SplashScreenGame({Key key}) : super(key: key);

  @override
  _SplashScreenGameState createState() => _SplashScreenGameState();
}

class _SplashScreenGameState extends State<SplashScreenGame> {

    FlameSplashController controller;

  @override
  void initState() { 
    super.initState();
    controller = FlameSplashController(
        fadeInDuration: Duration(seconds: 1),
        fadeOutDuration: Duration(milliseconds: 200),
        waitDuration: Duration(seconds: 1),
        autoStart: false
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        showBefore: (BuildContext context) {
          return const Text("SPACE SURVIVAL",style: TextStyle(color: Colors.white,fontSize: 15.0),);
        },
        // showAfter: (BuildContext context) {
        //   return const Text("After logo");
        // },
        theme: FlameSplashTheme.dark,
        onFinish: (context){
          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => MainPage()),(Route<dynamic> route)=> false);
        },
        controller:  controller,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}