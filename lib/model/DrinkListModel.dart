import 'package:scoped_model/scoped_model.dart';
import 'package:shopapp/model/DrinkType.dart';
import 'package:shopapp/widget/DrinkCards.dart';

class DrinkListModel extends Model {

   List<DrinkType> _drinkType = cofeeType;
   List<DrinkType> get drinkType => _drinkType;

   void updateDrinkList (List<DrinkType> type){
     _drinkType = type;
     notifyListeners();
   }
}