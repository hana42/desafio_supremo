import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_text.dart';

class BalanceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 210,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 65,
                      ),
                      child: CustomText(
                        text: 'Saldo',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/hide-icon.svg',
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                CustomText(
                  text: "RS 78.560,32",
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
