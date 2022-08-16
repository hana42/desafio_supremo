import 'package:flutter/material.dart';

import 'components/user_goals_list.dart';

// import 'components/savings_container.dart';

// import '../../shared/theme/constants.dart';

// import 'components/user_goals_list.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SavingsWidget(),
            // SizedBox(height: 60),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: Text(
            //     'Meus objetivos',
            //     maxLines: 1,
            //     overflow: TextOverflow.fade,
            //     style: Theme.of(context).textTheme.overline,
            //   ),
            // ),
            Center(child: Text('Não funciona')),
            SizedBox(height: 400),
            UserGoalsList(),
          ],
        ),
      ),
    );
  }
}
