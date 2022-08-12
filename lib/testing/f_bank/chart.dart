import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/testing/addons/money_statistics.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 350,
      height: 200,
      child: Column(children: [
        FinanceStatistics()
      ],)
    );
  }
}
