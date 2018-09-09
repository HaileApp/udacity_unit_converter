import 'package:flutter/material.dart';
import 'package:udacity_unit_converter/unit.dart';

class Category {

  final String name;
  final ColorSwatch color;
  final List<Unit> units;
  final String iconLocation;

  Category ({
    @required this.name,
    @required this.color,
    @required this.units,
    @required this.iconLocation,
}) : assert(name != null),
     assert(color != null),
     assert(units != null),
     assert(iconLocation != null);
}