
import 'package:flutter/material.dart';
import 'package:shopapp/model/DrinkType.dart';
import 'package:transparent_image/transparent_image.dart';

List<DrinkType> mainType = <DrinkType>[
  DrinkType ("Coffee","assets/img/cofee1.jpg", 20.0 ),
  DrinkType ("Tea","assets/img/cofee2.jpg", 20.0 ),
  DrinkType ("Juice","assets/img/cofee3.jpg", 20.0 ),
  DrinkType ("Drinks","assets/img/cofee3.jpg", 20.0 ),
];

List<DrinkType> cofeeType = <DrinkType>[
  DrinkType ("Coffee","assets/img/cofee1.jpg", 20.0 ),
  DrinkType ("Drinks","assets/img/cofee3.jpg", 20.0 ),
  DrinkType ("Tea","assets/img/cofee2.jpg", 20.0 ),
  DrinkType ("Juice","assets/img/cofee3.jpg", 20.0 ),
];

List<DrinkType> teaType = <DrinkType>[
  DrinkType ("Tea","assets/img/cofee1.jpg", 20.0 ),
  DrinkType ("Coffee","assets/img/cofee2.jpg", 20.0 ),
  DrinkType ("Juice","assets/img/cofee3.jpg", 20.0 ),
];

List<DrinkType> juiceType = <DrinkType>[
  DrinkType ("Juice","assets/img/cofee1.jpg", 20.0 ),
  DrinkType ("Tea","assets/img/cofee2.jpg", 20.0 ),
  DrinkType ("Drinks","assets/img/cofee3.jpg", 20.0 ),
  DrinkType ("Coffee","assets/img/cofee3.jpg", 20.0 ),
];


class DrinkCards extends StatelessWidget {

  final DrinkType drinkType;

  const DrinkCards({Key key, this.drinkType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Stack(
          children: <Widget>[
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(
                drinkType.image,
              ),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              fadeInDuration: Duration(
                microseconds: 1000,
              ),
              fadeInCurve: Curves.easeIn,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  drinkType.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
