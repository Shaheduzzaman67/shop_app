
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shopapp/model/DrinkListModel.dart';
import 'package:shopapp/widget/DrinkCards.dart';

class DrinkList extends StatelessWidget {
  @override
  Widget build(BuildContext scaffoldContext) {
    return ScopedModelDescendant<DrinkListModel>(
      builder: (context, _, model){
        return Expanded(
          child: GridView.count(
            padding: EdgeInsets.all(6.0),
            crossAxisCount: 2,
            children: model.drinkType.map((drinkType){
              return GestureDetector(
                onTap: (){
                  showDialog(
                      context: scaffoldContext,
                    builder:  (BuildContext dialogContext){
                        return AlertDialog (
                          title: Text(
                            "Order"
                          ),
                          content: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.yellowAccent,
                            ),
                            child: Row (
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Image.asset(
                                  drinkType.image,
                                  height: 100.0,
                                  width: 100.0,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        drinkType.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        "Price :\$${drinkType.price}"
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "Send",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.green,
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(dialogContext);
                                final snackBar = SnackBar (
                                  backgroundColor: Colors.white,
                                  duration: Duration(
                                    seconds: 4,
                                  ),
                                  content: Text(
                                    "${drinkType.title} order confirmed !",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                );
                                Scaffold.of(scaffoldContext).showSnackBar(snackBar);
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: (){
                                Navigator.pop(dialogContext);
                                final snackbar = SnackBar(
                                  backgroundColor: Colors.white,
                                  duration: Duration(
                                    seconds: 4,
                                  ),
                                  content: Text(
                                    "${drinkType.title} order Cencled !",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                );
                                Scaffold.of(scaffoldContext).showSnackBar(snackbar);
                              },
                            ),
                          ],
                        );
                    }
                  );
                },
                child: DrinkCards(
                  drinkType: drinkType,
                ),
              );
            }).toList() ,
          ),
        );
      },
    );

  }
}
