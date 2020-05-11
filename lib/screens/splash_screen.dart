import 'package:flutter/material.dart';
import 'package:practise/screens/calculator_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:practise/constants.dart';

const kIconTextStyle = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold);
const kBottomTextStyle = TextStyle(
    fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(0xFFF2F2F2));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _waitAndNavigate();
    super.initState();
  }

  _waitAndNavigate() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CalculatorScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF333333),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF2F2F2),
                ),
                margin: EdgeInsets.all(30.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('+', style: kIconTextStyle),
                          SizedBox(width: 10.0),
                          Text('-', style: kIconTextStyle),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '+',
                            style: kIconTextStyle,
                          ),
                          Text(
                            '-',
                            style: kIconTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'Calculator',
              style: kBottomTextStyle,
            ),
            SpinKitThreeBounce(
              color: kColor5,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
