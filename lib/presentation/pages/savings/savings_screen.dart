import 'package:flutter/material.dart';

import '../../shared/widgets/balance/balance_widget.dart';

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
          children: const [
            BalanceWidget(),
            SizedBox(height: 60),
            // Padding(
            //   padding: kDefaultPadding,
            //   child: Text(
            //     'Meus objetivos',
            //     maxLines: 1,
            //     overflow: TextOverflow.fade,
            //     style: Theme.of(context).textTheme.overline,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
