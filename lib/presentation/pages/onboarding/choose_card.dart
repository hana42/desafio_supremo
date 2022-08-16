import 'package:flutter/material.dart';

import '../../shared/theme/colors.dart';
import '../../shared/widgets/custom_button.dart';
import '../register/register_screen.dart';

import 'components/rotate_card.dart';

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
    return Scaffold(
      backgroundColor: kLightGrey,
      appBar: AppBar(backgroundColor: kLightGrey),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.threed_rotation, size: 38),
          RotateCard(cardColor: cardColor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () => setState(() => cardColor = Colors.black),
                color: kBlack,
                shape: const CircleBorder(),
              ),
              MaterialButton(
                onPressed: () => setState(() => cardColor = kDarkGrey),
                color: kDarkGrey,
                shape: const CircleBorder(),
              ),
              MaterialButton(
                onPressed: () => setState(
                    () => cardColor = Color.fromARGB(255, 192, 123, 117)),
                color: Color.fromARGB(255, 216, 129, 121),
                shape: const CircleBorder(),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            'Escolha seu cartão',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Assim que tiver certeza da sua escolha, \n basta clicar em confirmar.',
          ),
          CustomButton(
            'Confirmar',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => RegisterScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
