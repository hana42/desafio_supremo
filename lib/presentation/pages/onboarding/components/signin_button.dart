import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../widgets/glass.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key, required this.onPress}) : super(key: key);
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          GlassMorphism2(
            color: Colors.black,
            start: 0.8,
            end: 0.6,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              child: OutlinedButton(
                child: const Text(
                  'Começar',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: kLightGrey,
                  ),
                ),
                onPressed: () => onPress,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
