// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:structure_project/utils/app_text_style.dart';

class CommonTextGradient extends StatefulWidget {
  CommonTextGradient({super.key, this.clr, this.text, this.style});
  final List<Color>? clr;
  TextStyle? style;
  String? text;

  @override
  State<CommonTextGradient> createState() => _CommonTextGradientState();
}

class _CommonTextGradientState extends State<CommonTextGradient> {
  @override
  Widget build(BuildContext context) {
    return GradientText(
      widget.text ?? "",
      style: widget.style ?? size14(),
      gradientDirection: GradientDirection.ttb,
      radius: 2.5,
      colors: widget.clr ?? [Color(0xff268AE7), Color(0xffF913DD4)],
    );
  }
}
