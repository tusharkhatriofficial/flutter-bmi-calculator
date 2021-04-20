import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = 0xFF1D1E33;
const inactiveCardColor = 0xFF111328;
const bottomContainerColor = 0xFFEB1555;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int maleCardColour = inactiveCardColor;
  int femaleCardColour = inactiveCardColor;
  // 1 = male, 2 = female
  void updateColour(int gender){
    if (gender == 1){
      if (maleCardColour == inactiveCardColor){
        maleCardColour = activeCardColor;
        femaleCardColour = inactiveCardColor;
      }else{
        maleCardColour = inactiveCardColor;
      }
    }
    if (gender == 2){
      if (femaleCardColour == inactiveCardColor){
        femaleCardColour = activeCardColor;
        maleCardColour = inactiveCardColor;
      } else{
        femaleCardColour = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColour(1);
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: "MALE",
                    ),
                    colour: Color(maleCardColour),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColour(2);
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: "FEMALE",
                    ),
                    colour: Color(femaleCardColour),
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: Color(inactiveCardColor),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(inactiveCardColor),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(inactiveCardColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(bottomContainerColor),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}



//here is the extracted widget into method using ctrl + alt + m




//This is last line
