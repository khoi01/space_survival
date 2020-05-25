import 'package:flutter/material.dart';
import 'package:space_survival/main.dart';
import 'package:space_survival/route/CreditPage/CreditPage.dart';
import 'package:space_survival/route/Garage/GaragePage.dart';
import 'package:space_survival/route/LostPage/LostPage.dart';
import 'package:space_survival/route/MainPage/MainPage.dart';
import 'package:space_survival/route/Scoreboard/ScoreboardPage.dart';
import 'package:space_survival/route/Store/StorePage.dart';
import 'package:space_survival/route/Tutorial/TutorialPage.dart';

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

class AppConfig{
  static final Color backgroundColor = Colors.grey.shade400;
  static final double textBtnSize = 20;
}

class ImagePath{
  static String shieldIconPath = 'assets/images/shield/shield_1.png';
  static String heartIconPath = 'assets/images/heart/heart.png';
}
enum Routes{
  splash_screen,
  main_page,
  main_game,
  lost_page,
  credits_page,
  store_page,
  garage_page,
  scoreboard_page,
  tutorial_page,
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
      
      case Routes.credits_page:

      if(isRemovePreviousBackStack){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          CreditsPage()), (Route<dynamic> route) => false); 
      }else{
          Navigator.pushNamed(context,generateRoute);      
      }
        break;
        case Routes.store_page:
        if(isRemovePreviousBackStack){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          StorePage()), (Route<dynamic> route) => false); 
        }else{
          Navigator.pushNamed(context, generateRoute);
        }
        break;
      case Routes.garage_page:
        if(isRemovePreviousBackStack){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          GaragePage()), (Route<dynamic> route) => false);           
        }else{
          Navigator.pushNamed(context, generateRoute);
        }
        break;
      case Routes.scoreboard_page:
        if(isRemovePreviousBackStack){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          ScoreboardPage()), (Route<dynamic> route) => false); 
        }else{
          Navigator.pushNamed(context,generateRoute);
        }
        break;
      case Routes.tutorial_page:
        if(isRemovePreviousBackStack){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          TutorialPage()), (Route<dynamic> route) => false); 
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



