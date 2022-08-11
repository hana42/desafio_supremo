import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/goals/goals_bloc.dart';
import 'package:desafio_supremo/presentation/pages/backup/balance_widget.dart';
import 'package:desafio_supremo/presentation/widgets/balance_widget_2.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_item_card.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingsHome extends StatefulWidget {
  const SavingsHome({Key? key}) : super(key: key);

  @override
  State<SavingsHome> createState() => _SavingsHomeState();
}

class _SavingsHomeState extends State<SavingsHome> {
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
                              keyboardType: TextInputType.number,
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
                                    locator
                                        .get<SavingsBloc>()
                                        .add(AddSavings(_titleController.text));
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
        BlocBuilder<SavingsBloc, SavingsState>(
          bloc: locator.get<SavingsBloc>(),
          builder: (context, state) {
            if (state is SavingsLoaded) {
              if (state.listOfSavings.isEmpty) {
                return const Padding(
                  padding: kDefaultPadding,
                  child: Center(
                    child: Text(
                        'Você não possui nenhum objetivo definido até o momento. Que tal começar?'),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: state.listOfSavings.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(color: Colors.red),
                      key: Key(state.listOfSavings[index].title),
                      onDismissed: (direction) {
                        locator.get<SavingsBloc>().add(
                            RemoveSavings(state.listOfSavings[index].title));
                      },
                      child: UserGoalsCard(
                        title: state.listOfSavings[index].title,
                        subtitle: 'Tomar açaí',
                        savings: 500,
                        goal: 500,
                      ),
                      // child: CheckboxListTile(
                      //     tileColor: Colors.blueAccent.shade100,
                      //     activeColor: kPurple,
                      //     title: Text(state.listOfSavings[index].title),
                      //     value: state.listOfSavings[index].isCompleted,
                      //     onChanged: (value) {
                      //       locator.get<SavingsBloc>().add(
                      //             UpdateSavingsState(
                      //                 value!, state.listOfSavings[index].title),
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
