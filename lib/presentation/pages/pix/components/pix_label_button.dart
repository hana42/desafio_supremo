import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class LabelButton extends StatelessWidget {
  const LabelButton(this.label, this.icon, {Key? key, this.onPressed})
      : super(key: key);

  final String label;
  final IconData icon;
  final void Function()? onPressed;

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
