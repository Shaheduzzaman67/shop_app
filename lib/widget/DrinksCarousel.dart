import 'package:flutter/material.dart';
import 'package:shopapp/widget/DrinkCards.dart';

class DrinksCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 3.0,
            color: Colors.black26,
          )
        ),
        child: DrinkCards(
          drinkType: mainType[0],
        ),
      ),
    );
  }
}
