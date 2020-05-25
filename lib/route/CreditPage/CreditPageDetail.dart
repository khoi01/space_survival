import 'package:flutter/material.dart';


class CreditHeaderUI extends StatelessWidget {
  const CreditHeaderUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Credits",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25),),
      ),
    );
  }
}

class CreditContentUI extends StatelessWidget {
  const CreditContentUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: <Widget>[
          Card(
              child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Qayyum'),
            // subtitle: Text(''),
          )),
          Card(
              child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Firdaus'),
            // subtitle: Text(''),
          )),
          Card(
              child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Badariah'),
            // subtitle: Text(''),
          )),
        ],
      ),
    );
  }
}
