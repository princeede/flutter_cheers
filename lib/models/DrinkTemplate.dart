
class DrinkTemplate{
  final String _name;
  final double _percentage;
  final double _quantity;
  final double _price;

  DrinkTemplate(this._name, this._percentage, this._price, this._quantity);

  String get name => _name;
  double get percentage => _percentage;
  double get quality => _quantity;
  double get price => _price;

}