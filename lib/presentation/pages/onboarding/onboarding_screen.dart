import 'package:flutter/material.dart';

import '../login/login_screen.dart';
import 'components/register_button.dart';

import 'choose_card.dart';

class OnboardingScreen extends StatelessWidget {
  static Page<void> page() => MaterialPage<void>(child: OnboardingScreen());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding_7.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'O primeiro banco que não é banco',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Faça parte da experiência nobank, \n totalmente online, sem piadas.',
            ),
            CustomButton(
              'Começar',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => CardPicker()),
              ),
            ),
            TextButton.icon(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              ),
              label: Text('Já tenho uma conta'),
              icon: Icon(Icons.login),
            ),
          ],
        ),
      ),
    );
  }
}
