import 'package:flutter/material.dart';
import 'package:practise/constants.dart';
import 'package:practise/calculate.dart';

const buttonHeight = 58.0;
const buttonWidth = 58.0;

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String calcExpression;
  double totalResult;
  _removeValue() {
    calcExpression = calcExpression.substring(0, calcExpression.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColor3,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  //Result Area
                  _resultArea(),
                  //Expression Area
                  _expressionArea(),
                ],
              ),
            ),
            _buttonArea(),
          ],
        ),
      ),
    );
  }

  _resultArea() {
    return Text(
      totalResult == null ? '' : totalResult.toString(),
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 40.0,
      ),
    );
  }

  _expressionArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(
          child: Text(
            calcExpression ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        IconButton(
            icon: Icon(
              Icons.backspace,
              size: 35,
              color: Colors.redAccent,
            ),
            onPressed: () {
              if (calcExpression != null && calcExpression.length > 0) {
                setState(() {
                  _removeValue();
                });
              }
            })
      ],
    );
  }

  _buttonArea() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: kColor1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // 1st Column
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _ACcLearButton(),
                _BReusedCalcButton(text: '1'),
                _BReusedCalcButton(text: '4'),
                _BReusedCalcButton(text: '7'),
                _WReusedCalcButton(text: '+|-'),
              ],
            ),
            // 2nd Column
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _WReusedCalcButton(text: '%'),
                _BReusedCalcButton(text: '2'),
                _BReusedCalcButton(text: '5'),
                _BReusedCalcButton(text: '8'),
                _BReusedCalcButton(text: '0'),
              ],
            ),
            // 3rd Column
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _WReusedCalcButton(
                  text: '/',
                ),
                _BReusedCalcButton(text: '3'),
                _BReusedCalcButton(text: '6'),
                _BReusedCalcButton(text: '9'),
                _BReusedCalcButton(text: '.'),
              ],
            ),
            // 4th Column
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _WReusedCalcButton(text: 'x'),
                _WReusedCalcButton(text: '+'),
                _WReusedCalcButton(text: '-'),
                _SpecialReusedCalcButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _WReusedCalcButton({text}) {
    return FlatButton(
      onPressed: () {
        setState(() {
          calcExpression = calcExpression + text;
        });
      },
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(shape: BoxShape.circle, color: kColor5),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: kColor1, fontWeight: FontWeight.normal, fontSize: 25.0),
        )),
      ),
    );
  }

  _BReusedCalcButton({text}) {
    return FlatButton(
      onPressed: () {
        setState(() {
          if (calcExpression == null) {
            calcExpression = text;
          } else {
            calcExpression = calcExpression + text;
          }
        });
      },
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(shape: BoxShape.circle, color: kColor3),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: kColor5, fontWeight: FontWeight.normal, fontSize: 25.0),
        )),
      ),
    );
  }

  _ACcLearButton() {
    return FlatButton(
      onPressed: () {
        setState(() {
          calcExpression = '';
          totalResult = null;
        });
      },
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(shape: BoxShape.circle, color: kColor5),
        child: Center(
            child: Text(
          'AC',
          style: TextStyle(
              color: kColor1, fontWeight: FontWeight.normal, fontSize: 25.0),
        )),
      ),
    );
  }

  _SpecialReusedCalcButton() {
    return FlatButton(
      onPressed: () {
        final result = Calculator.evaluateExpression(calcExpression);
        setState(() {
          totalResult = result;
        });
      },
      child: Container(
        height: 138.0,
        width: buttonWidth,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: kColor4,
            borderRadius: BorderRadius.circular(30.0)),
        child: Center(
            child: Text(
          '=',
          style: TextStyle(
              color: kColor5, fontWeight: FontWeight.normal, fontSize: 25.0),
        )),
      ),
    );
  }
}
