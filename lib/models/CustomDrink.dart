import 'dart:core';

class CustomDrink {
  final String _name; //= "";
  final double _volume;// = 0;
  final double _percent;// = 0;
  final double _price;// = 0;
//  final double _quantity;// = 0;
//  final DateTime _startTime; //= new DateTime.now();
//  final DateTime _endTime; //= //new DateTime.now().add(new Duration(minutes: 30));

//  Drink(this._name, this._volume, this._percent, this._price, this._quantity, this._startTime, this._endTime);
  CustomDrink({
    String name = "",
    double volume = 0,
    double percent = 0,
    double price = 0,
    double quantity = 0,
    }) : this._name = name != null ? name : "",
  this._volume = volume != null ? volume : 0,
  this._percent = percent != null ? percent : 0,
  this._price = price != null ? price : 0;
//  this._quantity = quantity != null ? quantity : 0;

  String get name => _name;
  double get volume => _volume;
  double price(double qty) {
    return _price * qty.ceil();
  }
  double get percent => _percent;
//  double get quantity => _quantity;
//  DateTime get startTime => _startTime;
//  DateTime get endTime => _endTime;
//  Duration get drinkDuration => endTime.difference(startTime);

}