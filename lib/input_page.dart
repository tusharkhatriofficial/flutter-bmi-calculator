import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

//enum is always defined outside any class or function

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  // int maleCardColour = inactiveCardColor;
  // int femaleCardColour = inactiveCardColor;
  // 1 = male, 2 = female
  // void updateColour(Gender selectedGender){
  //   if (selectedGender == Gender.male){
  //     if (maleCardColour == inactiveCardColor){
  //       maleCardColour = activeCardColor;
  //       femaleCardColour = inactiveCardColor;
  //     }else{
  //       maleCardColour = inactiveCardColor;
  //     }
  //   }
  //   if (selectedGender == Gender.female){
  //     if (femaleCardColour == inactiveCardColor){
  //       femaleCardColour = activeCardColor;
  //       maleCardColour = inactiveCardColor;
  //     } else{
  //       femaleCardColour = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPressed: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.male,
                    label: "MALE",
                  ),
                  colour: selectedGender == Gender.male
                      ? Color(kActiveCardColor)
                      : Color(kInactiveCardColor),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPressed: (){
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.female,
                    label: "FEMALE",
                  ),
                  colour: selectedGender == Gender.female
                      ? Color(kActiveCardColor)
                      : Color(kInactiveCardColor),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: Color(kInactiveCardColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",
                  style: kLabelTextStyle,
                  ),
                  Row(
                    //Here is the base line topic
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(),
                      style: kNumberTextStyle,
                      ),
                      Text("cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                    colour: Color(kInactiveCardColor),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            )
                          ],
                        )
                      ],
                    ),
                    colour: Color(kInactiveCardColor),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height, weight:
              weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),),);
            },
          ),
        ],
      ),
    );
  }
}


//here is the extracted widget into method using ctrl + alt + m

//This is last line

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
