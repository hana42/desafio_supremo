import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_event.dart';
import 'package:desafio_supremo/presentation/bloc/balance/balance_visibility_bloc.dart';

import '../../../core/theme/colors.dart';
import '../../bloc/balance/balance_bloc.dart';
import '../../bloc/balance/balance_state.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  final bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      color: kLightGrey,
      padding: kBalancePadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Seu saldo'),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14),
                child: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () =>
                      locator.get<BalanceVisibilityBloc>().changeVisibility(),
                ),
              ),
            ],
          ),
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
                            Visibility(
                              visible: state,
                              replacement: Divider(
                                thickness: 4,
                                color: kPurple,
                                endIndent:
                                    MediaQuery.of(context).size.width / 1.8,
                              ),
                              child: Text(
                                Utils().formatCurrency(balance),
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ],
                        );
                      });
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
