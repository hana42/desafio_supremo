import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme/colors.dart';

import '../bloc/balance/balance_bloc.dart';
import '../bloc/balance/balance_state.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BalanceBloc, BalanceState>(builder: (context, state) {
      if (state is BalanceEmpty) {
        return const Text('Empty');
      } else if (state is BalanceLoading) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Seu saldo'),
                  IconButton(
                    icon: const Icon(Icons.remove_red_eye_rounded),
                    onPressed: () {},
                  )
                ],
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.white,
                child: Container(color: kLightGrey, height: 30, width: 100),
              )
            ]);
      } else if (state is BalanceHasData) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Seu saldo'),
                  IconButton(
                    icon: const Icon(Icons.remove_red_eye_rounded),
                    onPressed: () {},
                  )
                ],
              ),
              Visibility(
                // visible: visible ? true : false,
                replacement: Divider(
                  thickness: 4,
                  color: kPurple,
                  endIndent: MediaQuery.of(context).size.width / 1.8,
                ),
                child: Text(
                  NumberFormat.currency(
                          symbol: 'R\$', locale: 'PT_br', decimalDigits: 0)
                      .format(state.result.amount),
                  style: Theme.of(context).textTheme.headline5,
                ),
              )
            ]);
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
