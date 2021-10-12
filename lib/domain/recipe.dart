import 'package:coffea/bean/bean.dart';
import 'package:coffea/bean/grind_size.dart';
import 'package:flutter/material.dart';

class Recipe {
  final Bean bean;
  final GrindSize grindSize;
  final List<Step> steps;

  Recipe(this.bean, this.grindSize, this.steps);
}
