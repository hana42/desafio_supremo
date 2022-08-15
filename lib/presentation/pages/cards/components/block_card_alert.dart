import 'package:flutter/material.dart';

import '../../../shared/theme/colors.dart';

class BlockCardAlert extends StatelessWidget {
  const BlockCardAlert({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      height: size.height * 0.3,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Você quer ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 18),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'bloquear temporariamente ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(text: 'este cartão?'),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kLightGrey)),
                child: Text(
                  'Cancelar',
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: kBlack),
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent)),
                child: const Text('Bloquear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExpandedButton extends StatelessWidget {
  const ExpandedButton(
    this.text, {
    this.onTap,
    this.color,
    super.key,
  });
  
  final String text;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: color, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
