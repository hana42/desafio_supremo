import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/presentation/widgets/balance_widget_2.dart';
import 'package:desafio_supremo/presentation/widgets/credit_card.dart';
import 'package:desafio_supremo/presentation/widgets/custom_app_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Container(
      constraints: BoxConstraints(maxHeight: size.height * 0.52),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.center,
          end: FractionalOffset.topRight,
          colors: [Colors.grey[200]!, kLightGrey.withOpacity(1)],
        ),
      ),
      child: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(userName: 'David Bond'),
            const BalanceWidget2(),
            Container(
              alignment: Alignment.center,
              child: const CreditCard(color: kPurple, vertical: false),
            ),
          ],
        ),
      ),
    );
  }
}
