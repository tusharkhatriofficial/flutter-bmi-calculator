import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPressed});
  final Color colour;
  final Widget cardChild;//final makes this property immutable
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration:
        BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}