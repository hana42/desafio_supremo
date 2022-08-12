import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/pages/savings/components/goal_list.dart';
import 'package:desafio_supremo/presentation/pages/savings/components/goal_form_modal.dart';
import 'package:desafio_supremo/presentation/widgets/balance/balance_widget.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/goals/goals_cubit.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_item_card.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({Key? key}) : super(key: key);

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _goalController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
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
