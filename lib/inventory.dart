import 'package:flutter/material.dart';

class Inventory {
  String name, description;
  int quantity = 0;
  double costPrice, sellingPrice;
  ValueNotifier<bool> changed = ValueNotifier(true);

  Inventory({
    this.name = '',
    this.quantity = 0,
    this.costPrice = .0,
    this.sellingPrice = .0,
    this.description = "",
  });
}
