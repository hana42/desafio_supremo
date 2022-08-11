import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_bloc.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_event.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_state.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_visibility_bloc.dart';

class BalanceWidget2 extends StatelessWidget {
  const BalanceWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      color: null,
      padding: kBalancePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: BlocBuilder<BalanceBloc, BalanceState>(
              bloc: locator.get<BalanceBloc>()..add(FetchBalance()),
              builder: (context, state) {
                if (state is BalanceHasData) {
                  var balance = state.result.amount;

                  return BlocBuilder<BalanceVisibilityBloc, bool>(
                    bloc: locator.get<BalanceVisibilityBloc>(),
                    builder: (context, state) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const Text('Seu saldo'),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(3.14),
                                child: IconButton(
                                  icon: Icon(state
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () => locator
                                      .get<BalanceVisibilityBloc>()
                                      .changeVisibility(),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    transform: Matrix4.translationValues(
                                        0, state ? 0 : -10, 0),
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      opacity: state ? 1.0 : 0.0,
                                      child: Text(
                                        Utils().formatCurrency(balance),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    transform: Matrix4.translationValues(
                                        0, state ? -10 : 0, 0),
                                    child: AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      opacity: state ? 0.0 : 1.0,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: kPurple,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[200]!,
                    highlightColor: kLightGrey,
                    child: Container(
                      color: kPurple,
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
