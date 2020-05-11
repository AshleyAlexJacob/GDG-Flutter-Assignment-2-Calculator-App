import 'package:math_expressions/math_expressions.dart';

class Calculator {
  static evaluateExpression(inputExp) {
    Parser parsedExpression = Parser();
    Expression expression = parsedExpression.parse(inputExp);
    try {
      double answer = expression.evaluate(EvaluationType.REAL, ContextModel());
      return answer;
    } catch (e) {
      print('Exception @Evaluat: $e');
    }
  }
}
