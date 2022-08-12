import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/goals/goals_cubit.dart';

class GoalFormModal extends StatefulWidget {
  const GoalFormModal({Key? key}) : super(key: key);

  @override
  State<GoalFormModal> createState() => _GoalFormModalState();
}

class _GoalFormModalState extends State<GoalFormModal> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _goalController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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

    return AlertDialog(
      content: SizedBox(
        height: size.height * 0.5,
        width: size.width * 0.8,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Novo Objetivo'),
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _goalController,
                decoration: const InputDecoration(
                  hintText: 'Valor',
                  prefixText: 'R\$ ',
                ),
                validator: (value) {
                  return value!.isEmpty ? 'Insira um valor' : null;
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
                child: const Text('Adicionar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
