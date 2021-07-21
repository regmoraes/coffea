import 'package:coffea/coffee/beans.dart';
import 'package:coffea/coffee/grind_size.dart';
import 'package:flutter/material.dart';

class Recipe {
  final Bean bean;
  final GrindSize grindSize;
  final List<Step> steps;

  Recipe(this.bean, this.grindSize, this.steps);
}
