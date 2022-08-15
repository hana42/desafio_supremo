import 'package:flutter/material.dart';

import '../../../shared/theme/colors.dart';
import '../../../shared/widgets/balance/balance_widget.dart';
import '../../../shared/widgets/credit_card.dart';

import 'home_app_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(maxHeight: size.height * 0.53),
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
            HomeAppBar(),
            const BalanceWidget(),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const CreditCard(color: kBlack, vertical: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
