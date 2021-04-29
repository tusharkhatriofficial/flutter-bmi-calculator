import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.weight, this.height});
  final int weight;
  final int height;

  double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi>=25){
      return "Overweight";
    }else if(_bmi>18.5){
      return "Normal";
    } else{
      return "Underweight";
    }
  }// getResult

  String getInterpretation(){

    if (_bmi>=25){
      return "Obesity is killing you ! You should exercise more.";
    }else if(_bmi>18.5){
      return "Your BMI is perfect, Try to keep it maintained.";
    } else{
      return "You are loosing you weight ! Please eat more.";
    }

  }//getIn..


}