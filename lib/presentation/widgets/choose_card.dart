import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import 'card_transform.dart';

class CardPicker extends StatefulWidget {
  const CardPicker({Key? key}) : super(key: key);

  @override
  State<CardPicker> createState() => _CardPickerState();
}

class _CardPickerState extends State<CardPicker>
    with SingleTickerProviderStateMixin {
  Color cardColor = kBlack;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.threed_rotation),
          onPressed: () {},
        ),
        MyTransform(
          cardColor: cardColor,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => setState(() {
                cardColor = Colors.pinkAccent;
              }),
              radius: 200,
              child: const Text('dsadsadas'),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  cardColor = kBlack;
                });
              },
              color: kBlack,
              shape: const CircleBorder(),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  cardColor = kDarkGrey;
                });
              },
              color: kDarkGrey,
              shape: const CircleBorder(),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  cardColor = kPurple;
                });
              },
              color: kPurple,
              shape: const CircleBorder(),
            ),
          ],
        )
      ],
    );
  }
}
