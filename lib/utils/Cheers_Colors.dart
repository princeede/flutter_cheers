import 'package:flutter/material.dart';
//import 'palette.dart' show Palette;

class HexColor extends Color{
  static _hexColor(String code){
    return int.parse(code.substring(1, 7), radix: 16) + 0xFF000000;
  }
  HexColor(final String code) : super(_hexColor(code));
}

//class MaterialBrown extends Palette {
//  static const _shade200 = const Color(r: 0xEF, g: 0x9A, b: 0x9A); //#EF9A9A
//  static const _shade700 = const Color(r: 0xD3, g: 0x2F, b: 0x2F); //#D32F2F
//  static const _shade500 = const Color(
//      r: 0xF4, g: 0x43, b: 0x36, darker: _shade700, lighter: _shade200);
//
//  const MaterialRed();
//
//  @override
//  Color get shadeDefault => _shade500;
//}