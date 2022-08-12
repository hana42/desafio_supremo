import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/goals/goals_cubit.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_item_card.dart';

class GoalList extends StatelessWidget {
  const GoalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalCubit, GoalState>(
      bloc: locator.get<GoalCubit>(),
      builder: (context, state) {
        if (state is GoalLoaded) {
          return Column(
            children: [
              if (state.goalsList.isEmpty)
                const Padding(
                  padding: kDefaultPadding,
                  child: Center(
                    child: Text(
                      'Você não possui nenhum objetivo definido até o momento.',
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: state.goalsList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        background: Container(color: Colors.red),
                        key: Key(state.goalsList[index].title),
                        onDismissed: (direction) {
                          locator
                              .get<GoalCubit>()
                              .remove(state.goalsList[index].title);
                        },
                        child: UserGoalsCard(
                          title: state.goalsList[index].title,
                          subtitle: state.goalsList[index].description,
                          goal: state.goalsList[index].goal,
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
