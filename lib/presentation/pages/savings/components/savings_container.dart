import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../bloc/Savings/savings_cubit.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/constants.dart';
import '../../../shared/widgets/error_dialog.dart';
import '../../../shared/widgets/shimmer_loading.dart';

import 'animated_savings_container.dart';

class SavingsWidget extends StatelessWidget {
  SavingsWidget({Key? key}) : super(key: key);
  final SavingsCubit cubit = locator.get<SavingsCubit>();

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
              Text(
                'Seu saldo',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              IconButton(
                icon: const Icon(Icons.remove_red_eye_rounded),
                onPressed: () {},
              ),
            ],
          ),
          BlocListener<SavingsCubit, SavingsState>(
            bloc: cubit,
            listener: (context, state) {
              if (state is SavingsError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    margin: kDefaultPadding / 2,
                    content: ErrorDialog(failure: state.failure),
                  ),
                );
              }
            },
            child: BlocBuilder<SavingsCubit, SavingsState>(
              bloc: cubit..getSavings(),
              builder: (context, state) {
                if (state is SavingsSuccess) {
                  var savings = state.amount.amount;

                  return AnimatedSavingsContainer(
                    amount: savings,
                    visibility: true,
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
