import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'custom_text.dart';

class PercentWidget extends StatelessWidget {
  final double? value;
  final String? text;
  final String? textvalue;

  const PercentWidget({super.key, this.value, this.text, this.textvalue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 130,
          child: CircularPercentIndicator(
            radius: 58,
            lineWidth: 6,
            percent: value!,
            animation: true,
            animationDuration: 1500,
            center: CustomText(
              text: textvalue!,
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            footer: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                text!,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            progressColor: Colors.blueGrey,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        )
      ],
    );
  }
}
