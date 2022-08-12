import 'package:animate_do/animate_do.dart';
import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 1),
      child: Row(
        children: [
          const Text(
            'Expenses',
            style: TextStyle(
                color: kBlack, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          const Icon(
            Icons.more_horiz_outlined,
            color: kBlack,
            size: 25,
          )
        ],
      ),
    );
  }
}
