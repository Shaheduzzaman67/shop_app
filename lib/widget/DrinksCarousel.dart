import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shopapp/model/DrinkListModel.dart';
import 'package:shopapp/widget/DrinkCards.dart';

class DrinksCarousel extends StatefulWidget {
  @override
  _DrinksCarouselState createState() => _DrinksCarouselState();
}

class _DrinksCarouselState extends State<DrinksCarousel> with SingleTickerProviderStateMixin {

  TabController _tabController;
  Timer _carouselTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: cofeeType.length, vsync: this);
    _carouselTimer = Timer.periodic(
        Duration(
          seconds: 4,
        ),
        (timer){
          _changeImage(delta: 1);
        }
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _carouselTimer.cancel();
  }

  void _changeImage ({int delta, bool userInput= false}){
    if(userInput){
      _carouselTimer.cancel();
    }
    imageCache.clear();
  var newtabIndex= _tabController.index + delta;
  if(newtabIndex>= cofeeType.length){
    newtabIndex = 0;
  }else if(newtabIndex <0){
    newtabIndex = cofeeType.length-1;
  }
  _tabController.animateTo(
    newtabIndex,
    duration: Duration(
      microseconds: 1000,
    ),
    curve: Curves.easeIn,
  );
}

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
        child: Stack(
          children: <Widget>[
            ScopedModelDescendant<DrinkListModel>(
              rebuildOnChange: false,
              builder: (context, _, model){
                return TabBarView(
                  controller: _tabController,
                  children: mainType.map((drinkType){
                    return GestureDetector(
                      onTap: (){
                        var type;
                        switch (drinkType.title){
                          case "Coffee" :
                            type = cofeeType;
                          break;
                          case "Tea" :
                          type = teaType;
                          break;
                          case "Juice" :
                            type = juiceType;
                            break;
                          default:
                            throw "${drinkType.title} is not recognized";
                        }
                        _carouselTimer.cancel();
                        model.updateDrinkList(type);
                      },
                      child: DrinkCards(
                        drinkType: drinkType,
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabPageSelector(
                  controller: _tabController,
                  color: Colors.white,
                  indicatorSize: 18.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_left,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: (){
                  _changeImage(
                    delta:  -1,
                    userInput: true
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 40.0,
                ),
                onPressed: (){
                  _changeImage(
                    delta: 1,
                    userInput: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
