import "package:flutter/material.dart";
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_todo/widgets/logo.widget.dart';

import 'widgets/input.widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Alccol ou Gasolina",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _gasCtrl = new MoneyMaskedTextController();
  var _accCtrl = new MoneyMaskedTextController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(children: [
        Logo(),
        Container(
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Text(
                "Compensa utilizar álcool",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40,
                  fontFamily: "Big Shoulders Display",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(30),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: FlatButton(
                  child: Text(
                    "CALCULAR NOVAMENTE",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
        Input(
          ctrl: _gasCtrl,
          label: 'Gasolina',
        ),
        Input(
          ctrl: _accCtrl,
          label: 'Álcool',
        ),
        Container(
          margin: EdgeInsets.all(30),
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
          ),
          child: FlatButton(
            child: Text(
              "CALCULAR",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontFamily: "Big Shoulders Display",
              ),
            ),
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}
