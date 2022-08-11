import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';

class PixScreen extends StatelessWidget {
  const PixScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Minha área Pix',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Tudo o que você precisa para pagar, transferir ou cobrar.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LabelButton('Pagar', Icons.payment, onPressed: () {}),
                      LabelButton('Transferir', Icons.send, onPressed: () {}),
                      // LabelButton('Cobrar', Icons.payments, onPressed: () {}),
                      OptionCard(Icons.payment, 'Pagar', PixScreen()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: const [
              PixMenu('Minhas chaves', Icons.key),
              PixMenu('Meu limite Pix', Icons.settings),
              PixMenu('Me ajuda', Icons.help),
            ],
          ),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  const OptionCard(this.icon, this.name, this.page, {Key? key})
      : super(key: key);

  final IconData icon;
  final String name;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return LabelButton(name, icon);
  }
}

class PixMenu extends StatelessWidget {
  const PixMenu(this.text, this.icon, {Key? key, this.onTap}) : super(key: key);

  final String text;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: kLightGrey,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Icon(icon, color: kPurple),
                const SizedBox(width: 20),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward,
              color: kPurple,
            ),
          ],
        ),
      ),
    );
  }
}

class LabelButton extends StatelessWidget {
  const LabelButton(this.label, this.icon, {Key? key, this.onPressed})
      : super(key: key);

  final String label;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: kLightGrey,
            onSurface: kPurple,
            shadowColor: kLightGrey,
            elevation: 2,
            fixedSize: const Size(62, 62),
            side: const BorderSide(width: 1, color: kLightGrey),
            shape: const CircleBorder(),
          ),
          child: Icon(icon, color: kPurple),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}
