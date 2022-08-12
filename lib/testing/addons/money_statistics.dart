// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/domain/usecases/get_statement.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:flutter/material.dart';

class FinanceStatistics extends StatefulWidget {
  const FinanceStatistics({Key? key}) : super(key: key);

  @override
  State<FinanceStatistics> createState() => _FinanceStatisticsState();
}

class _FinanceStatisticsState extends State<FinanceStatistics> {
  final GetStatement _getStatement = locator.get<GetStatement>();

  List statements = [];
  var expenses;
  var income;

  expensesCalc() async {
    bool max = false;
    int offset = 1;

    while (max == false) {
      var get = await _getStatement.get(10, offset);
      get.right.isEmpty ? max = true : statements.addAll(get.right);
      offset++;
    }
    return statements;
  }

  calc(var list) {
    var e;
    var i;
    var a =[];
    var b =[];
    for (var i in list) {
      if (Utils().statementTType(i.tType)) {
        a.add(i.amount);
      } else {
        b.add(i.amount);
      }
    }
    if (a.isNotEmpty) {
      i = a.reduce((value, element) => value + element);
    }
    if (b.isNotEmpty) {
      e = b.reduce((value, element) => value + element);
    }
    income = i;
    expenses = e;
  }

  test() async {
    var tests = await expensesCalc();
    print(tests);
    calc(tests);
  }

  @override
  void initState() {
    test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return income != null && expenses != null
    ? Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('income'),
            Text('expenses'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              income.toString(),
            ),
            Text(
             expenses.toString(),
            ),
          ],
        ),
      ],
    )
    : Text('a');
  }
}
