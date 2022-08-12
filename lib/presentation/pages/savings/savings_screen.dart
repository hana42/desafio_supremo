import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/goals/goals_cubit.dart';
import 'package:desafio_supremo/presentation/widgets/balance_widget.dart';
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
        title: const Text('Minha Poupança'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: SizedBox(
                      height: size.height * 0.5,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Nova Poupança'),
                            const SizedBox(
                              height: 10,
                            ),
                            FormField(
                              builder: (field) {
                                return TextField(
                                  controller: _titleController,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    label: Text('Título'),
                                  ),
                                );
                              },
                            ),
                            TextFormField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                label: Text('Descrição'),
                              ),
                            ),
                            TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              controller: _goalController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Qual o valor do seu objetivo?'),
                              ),
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Field can't be empty"
                                    : null;
                              },
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    locator.get<GoalCubit>().add(
                                          _titleController.text,
                                          _descriptionController.text.isNotEmpty
                                              ? _descriptionController.text
                                              : null,
                                          double.parse(_goalController.text),
                                        );
                                    _titleController.clear();

                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Add'))
                          ],
                        ),
                      ),
                    ),
                  ));
        },
        child: const Icon(Icons.add),
      ),
      body: const SavingsList(),
    );
  }
}

class SavingsList extends StatelessWidget {
  const SavingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceWidget(),
        BlocBuilder<GoalCubit, GoalState>(
          bloc: locator.get<GoalCubit>(),
          builder: (context, state) {
            if (state is GoalLoaded) {
              state.listOfGoal.isEmpty
                  ? const Padding(
                      padding: kDefaultPadding,
                      child: Center(
                        child: Text(
                            'Você não possui nenhum objetivo definido até o momento. Que tal começar?'),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: state.listOfGoal.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: Container(color: Colors.red),
                            key: Key(state.listOfGoal[index].title),
                            onDismissed: (direction) {
                              locator
                                  .get<GoalCubit>()
                                  .remove(state.listOfGoal[index].title);
                            },
                            child: UserGoalsCard(
                              title: state.listOfGoal[index].title,
                              subtitle: state.listOfGoal[index].description,
                              goal: state.listOfGoal[index].goal,
                            ),
                            // child: CheckboxListTile(
                            //     tileColor: Colors.blueAccent.shade100,
                            //     activeColor: kPurple,
                            //     title: Text(state.listOfGoal[index].title),
                            //     value: state.listOfGoal[index].isCompleted,
                            //     onChanged: (value) {
                            //       locator.get<SavingsBloc>().add(
                            //             UpdateSavingsState(
                            //                 value!, state.listOfGoal[index].title),
                            //           );
                            //     }),
                          );
                        },
                      ),
                    );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
