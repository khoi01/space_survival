import 'package:shared_preferences/shared_preferences.dart';

class CoinRepository{
  static String coinKey = "CoinKey";

  static void addCoin(double coin) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double currentCoin = preferences.getDouble(coinKey) ?? 0;
    preferences.setDouble(coinKey,currentCoin+=coin);
  }

  static deductCoin(double deductCoin) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    double currentCoin = preferences.getDouble(coinKey);
    double balance = currentCoin - deductCoin;
    preferences.setDouble(coinKey,balance);
  }

   static Future<double> getCoin() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double coin = preferences.getDouble(coinKey) ?? 0;
    return coin;
  }
}