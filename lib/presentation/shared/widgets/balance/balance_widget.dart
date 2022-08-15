import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../bloc/balance/balance_cubit.dart';
import '../../../bloc/balance/balance_visibility_cubit.dart';
import '../../theme/colors.dart';
import '../../theme/constants.dart';
import '../error_dialog.dart';
import '../shimmer_loading.dart';

import 'animated_balance_container.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 7,
      width: size.width,
      color: kLightGrey,
      padding: kBalancePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Seu saldo'),
              IconButton(
                icon: const Icon(Icons.remove_red_eye_rounded),
                onPressed: () {
                  locator.get<BalanceVisibilityCubit>().changeVisibility();
                },
              ),
            ],
          ),
          BlocListener<BalanceCubit, BalanceState>(
            bloc: locator.get<BalanceCubit>(),
            listener: (context, state) {
              if (state is BalanceError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    margin: kDefaultPadding / 2,
                    content: ErrorDialog(error: state.error),
                  ),
                );
              }
            },
            child: BlocBuilder<BalanceCubit, BalanceState>(
              bloc: locator.get<BalanceCubit>()..getBalance(),
              builder: (context, state) {
                if (state is BalanceSuccess) {
                  var balance = state.balance.amount;

                  return BlocBuilder<BalanceVisibilityCubit, bool>(
                    bloc: locator.get<BalanceVisibilityCubit>(),
                    builder: (context, state) {
                      return AnimatedBalanceContainer(
                        amount: balance,
                        visibility: locator.get<BalanceVisibilityCubit>().state,
                      );
                    },
                  );
                } else {
                  return ShimmerLoading(
                      child: Container(
                    color: kLightGrey,
                    width: size.width * 0.4,
                    height: size.height * 0.02,
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
