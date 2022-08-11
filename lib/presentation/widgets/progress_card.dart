import 'package:flutter/material.dart';

import 'custom_text.dart';

class ProgressCard extends StatelessWidget {
  final double? value;
  final String? text;
  final String? textvalue;

  const ProgressCard({super.key, this.value, this.text, this.textvalue});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    value: value!,
                    strokeWidth: 6,
                    backgroundColor: Colors.blueGrey[100],
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: CustomText(
                    text: textvalue!,
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 135,
                  width: 100,
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    text: text!,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
