import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SizeMediaQuery on BuildContext {
  double get _height => MediaQuery.of(this).size.height;
  double get _width => MediaQuery.of(this).size.width;

  double widthPercent(double valorPorcentagem) => width * valorPorcentagem;
  double heightPercent(double valorPorcentagem) => height * valorPorcentagem;
}
