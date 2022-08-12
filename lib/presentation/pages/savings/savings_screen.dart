import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/pages/savings/components/goal_list.dart';
import 'package:desafio_supremo/presentation/pages/savings/components/goal_form_modal.dart';
import 'package:desafio_supremo/presentation/widgets/balance/balance_widget.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poupança'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const GoalFormModal(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BalanceWidget(),
            const SizedBox(height: 60),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Meus objetivos',
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.overline,
              ),
            ),
            const GoalList(),
          ],
        ),
      ),
    );
  }
}
