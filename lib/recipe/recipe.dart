import 'package:coffea/bean/model/bean.dart';
import 'package:coffea/bean/model/grind_size.dart';
import 'package:flutter/material.dart';

class Recipe {
  final Bean bean;
  final Size grindSize;
  final List<Step> steps;

  Recipe(this.bean, this.grindSize, this.steps);
}
