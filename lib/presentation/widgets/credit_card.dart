import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/themeStyles.dart';

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 216,
          width: 380,
          decoration: BoxDecoration(
            color: primaryColor,
            image: DecorationImage(
                image: AssetImage('assets/images/background2.jpg'),
                fit: BoxFit.cover),
            // color: ThemeColors.black,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NoBank', style: ThemeStyles.cardMoney),
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 11,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    bottom: 32.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('David Bond', style: ThemeStyles.cardDetails),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child:
                                SvgPicture.asset('assets/icons/card-dots.svg'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child:
                                SvgPicture.asset('assets/icons/card-dots.svg'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child:
                                SvgPicture.asset('assets/icons/card-dots.svg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text('9018', style: ThemeStyles.cardDetails),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 65),
                            child:
                                Text('05/25', style: ThemeStyles.cardDetails),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
