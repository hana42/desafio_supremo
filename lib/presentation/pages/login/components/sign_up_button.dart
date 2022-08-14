import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/pages/sign_up/view/sign_up_page.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key('signUpForm_continue_raisedButton'),
      children: [
        Text(
          'Não tem uma conta?',
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
          child: Text(
            'Registrar',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
