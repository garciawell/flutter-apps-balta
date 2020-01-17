import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_todo/widgets/logo.widget.dart';
import 'package:flutter_todo/widgets/submit-form.dart';
import 'package:flutter_todo/widgets/success.widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasCtrl = new MoneyMaskedTextController();
  var _accCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 400,
        ),
        color: _color,
        child: ListView(
          children: [
            Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    alcCtrl: _accCtrl,
                    gasCtrl: _gasCtrl,
                    submitFunc: calculate,
                    busy: _busy,
                  ),
          ],
        ),
      ),
    );
  }

  convertValues(key) {
    return double.parse(key.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
  }

  Future calculate() {
    double alc = convertValues(_accCtrl);

    double gas = convertValues(_gasCtrl);

    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _busy = true;
    });

    return new Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
          _color = Colors.blue;
        } else {
          _resultText = "Compensa utilizar Álcool!";
          _color = Colors.green;
        }

        _busy = false;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _accCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
