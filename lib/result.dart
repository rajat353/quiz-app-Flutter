import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';

class Second extends StatefulWidget {
  var res;
  Second({Key key, this.res}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SecondState(res: res);
  }
}

class SecondState extends State<Second> {
  void restart() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new First()));
    });
  }

  var res;
  SecondState({Key key, this.res});
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  exit(0);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var qu = ['Conclusion'];
    var con=['','',''];

    for(int k=0;k<3;k++)
    {
      if(res[k]==1)
        con[k]='Yes';
      else if(res[k]==0)
        con[k]='no';
      else
        con[k]='Skip';

    }
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Text(qu[0]),
            )),
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Column(children: [
            Center(
              child: Text( 'Answer 1='+
                  con[0]+ '\n'+'Answer 2='+
                  con[1]+ '\n'+'Answer 3='+
                  con[2],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red[600],
                ),
              ),
            ),
            RaisedButton(
              child: Text(
                'Restart',
              ),
              onPressed: restart,
            ),
          ]),
        ));
  }
}