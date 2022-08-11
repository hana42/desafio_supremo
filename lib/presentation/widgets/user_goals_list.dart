import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_item_card.dart';
import 'package:flutter/material.dart';

class UserGoalsList extends StatelessWidget {
  const UserGoalsList({Key? key}) : super(key: key);

  final goalsList = const [
    {
      'title': 'Casa Nova',
      'subtitle':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'savings': 0,
      'goal': 500,
    },
    {
      'title': 'Viagem Americana',
      'subtitle': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      'savings': 100,
      'goal': 500,
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: kDefaultPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Meus Objetivos',
            style: Theme.of(context).textTheme.overline,
          ),
          SizedBox(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: goalsList.length,
              itemBuilder: (context, index) {
                return UserGoalsCard(
                  title: goalsList[index]['title'].toString(),
                  subtitle: goalsList[index]['subtitle'].toString(),
                  savings: 10,
                  goal: 100,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
