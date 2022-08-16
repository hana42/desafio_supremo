import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/pages/savings/components/savings_container.dart';
import 'package:desafio_supremo/presentation/pages/savings/user_goals_list.dart';

import '../../shared/theme/constants.dart';

class SavingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poupança'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SavingsWidget(),
            SizedBox(height: 60),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Meus objetivos',
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            UserGoalsList(),
          ],
        ),
      ),
    );
  }
}
