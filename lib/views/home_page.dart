import 'package:flutter_demo/config/NavigatorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/model/Person.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String name = "huangsijin";
    int age = 18;
    double score = 10.0;
    bool sex = true;
    Person person = new Person(name: 'alan', age: 3, sex: false);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('这是主页!!!!')),
          RaisedButton(
            child: Text('传递参数string ,int，double，bool '),
            onPressed: () {
              NavigatorUtil.goDemoParamsPage(
                  context, name, age, score, sex, person);
            },
          ),
          RaisedButton(
            child: Text('传递参数,接受返回值！！！'),
            onPressed: () {
              NavigatorUtil.goReturnParamsPage(context).then((result) {
                debugPrint('${result.runtimeType}');
                String message ;
                if (result.runtimeType == Person) {
                  message = result.toJson().toString();
                  debugPrint('${result.toJson().toString()}');
                } else {
                  message = '$result';
                  debugPrint('$result');
                }
                showResultDialog(context, message);
              });
            },
          ),
          RaisedButton(
            child: Text('PersonListView'),
            onPressed: () {
                 //todo
            },
          ),
          RaisedButton(
            child: Text('Per'),
            onPressed: () {
                //todo
            },
          ),

        ],
      ),
    );
  }

  void showResultDialog(BuildContext context,String message){
    showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text(
            "Hey Hey!",
            style: new TextStyle(
              color: const Color(0xFF00D6F7),
              fontFamily: "Lazer84",
              fontSize: 22.0,
            ),
          ),
          content: new Text("$message"),
          actions: <Widget>[
            new Padding(
              padding: new EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: new Text("OK"),
              ),
            ),
          ],
        );
      },
    );
  }
}

