import 'package:flutter/material.dart';
import 'package:space_survival/main.dart';
import 'package:space_survival/route/LostPage/LostPage.dart';
import 'package:space_survival/route/MainPage/MainPage.dart';

enum Level{
  one,
  two,
  three,
  test_collision_comet_and_spaceships
}

class Time{
  static int getCurrentTime(){
    return DateTime.now().millisecondsSinceEpoch;
  }
}



enum Routes{
  splash_screen,
  main_page,
  main_game,
  lost_page
}


class Nav{
  static route(BuildContext context,Routes route,dynamic value,{bool isRemovePreviousBackStack = false}){

    String generateRoute = "/$route"; 
    switch(route){
      case Routes.main_page:

      if(isRemovePreviousBackStack){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        MainPage()), (Route<dynamic> route) => false); 
      }else{
        Navigator.pushNamed(context,generateRoute);      

      }
    break;
      case Routes.main_game:

      if(isRemovePreviousBackStack){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        MainGame()), (Route<dynamic> route) => false);         
      }else{
        Navigator.pushNamed(context,generateRoute);      
      }
      break;

      case Routes.lost_page:

        int score = value as int;

        if(isRemovePreviousBackStack){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          LostPage(score: score,)), (Route<dynamic> route) => false); 
        }else{
          Navigator.pushNamed(context,generateRoute);      
        }
        break;
        
      default:
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        MainPage()), (Route<dynamic> route) => false);         break;
    }
  }
}



