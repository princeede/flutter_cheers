import './CustomDrink.dart';

class Drink{
  final CustomDrink _customDrink;
  final DateTime _startTime;
  final DateTime _endTime;
  final double _quantity;

  Drink(this._customDrink, this._startTime, this._endTime, this._quantity);

  CustomDrink get customDrink => _customDrink;
  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;
  double get quantity => _quantity;
  Duration get drinkDuration => endTime.difference(startTime);
}