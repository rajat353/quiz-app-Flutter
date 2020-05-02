import 'dart:io';
import 'package:flutter/material.dart';
import 'result.dart';

void main() {
  runApp(
    MaterialApp(
      home: First(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class First extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return FirstState();
  }
}

class FirstState extends State<First> {
  var index = 0;
  var res = [-1, -1, -1];
  bool hide=true;
  void yes() {
    res[index] = 1;
    setState(() {
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Second(res: res)));
      } else
        {index = index + 1;
        if(index==2)
        hide=false;
        }
    });
  }

  void no() {
    res[index] = 0;
    setState(() {
      if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Second(res: res)));
      } else
        {index = index + 1;
        if(index==2)
        hide=false;
        }
    });
  }

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
  
  void new1()
  {
      setState(() {
        index=index+1;
        if(index==2)
        hide=false;
      }); 
  }

  @override
  Widget build(BuildContext context) {
    var qu = ['First question', 'Second Question', 'Third Question'];
    var question = [
      'This is Question 1',
      'This is Question 2',
      'This is Question 3'
    ];
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget>[
            hide ?
            FlatButton(
      textColor: Colors.white,
      onPressed: new1,
      splashColor: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
      child: Text("Skip->", style: TextStyle(fontSize: 18.0),),
      
      
    ) :SizedBox(),
          ],
            automaticallyImplyLeading: false,
            
            title: 
               Text(qu[index]),
            ),
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Column(
            children: [
              Center(
                  child: Text(
                question[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red[600],
                ),
              )),
              RaisedButton(
                child: Text(
                  'Yes',
                ),
                onPressed: yes,
              ),
              RaisedButton(
                child: Text(
                  'No',
                ),
                onPressed: no,
              ),
            ],
          ),
        ));
  }
}


