import 'package:flutter/material.dart';

import '../../register/register_screen.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      key: const Key('RegisterForm_continue_raisedButton'),
      children: [
        Text('Não tem uma conta?'),
        TextButton(
          onPressed: () =>
              Navigator.of(context).push<void>(RegisterScreen.route()),
          child: Text(
            'Registrar',
            style: Theme.of(context).textTheme.overline!,
          ),
        ),
      ],
    );
  }
}
