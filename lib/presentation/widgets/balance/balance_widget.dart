import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../injection.dart';
import '../../bloc/balance/balance_cubit.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width,
      color: kLightGrey,
      padding: kBalancePadding,
      child: BlocBuilder<BalanceCubit, BalanceState>(
        bloc: locator.get<BalanceCubit>()..getBalance(),
        builder: (context, state) {
          if (state is BalanceInitial) {
            return const Text('Empty');
          } else if (state is BalanceSuccess) {
            var balance = state.balance.amount;
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
                    ),
                  ],
                ),
                Visibility(
                  replacement: Divider(
                    thickness: 4,
                    color: kPurple,
                    endIndent: MediaQuery.of(context).size.width / 1.8,
                  ),
                  child: Text(
                    Utils().formatCurrency(balance),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
