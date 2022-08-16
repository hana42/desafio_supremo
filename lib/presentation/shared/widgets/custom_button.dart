import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.title, {Key? key, required this.onPressed}) : super(key: key);
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDefaultPadding,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kBlack, kBlack.withOpacity(0.8)],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: OutlinedButton(
          child: Text(title),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
