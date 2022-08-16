import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/di/injection.dart';
import '../../../bloc/app/app_bloc.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/widgets/nav_menu_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: kBlack),
            accountName: Text(
              FirebaseAuth.instance.currentUser?.displayName ?? '',
            ),
            accountEmail: Text(FirebaseAuth.instance.currentUser?.email ?? ''),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavMenuItem('Conta', Icons.account_box),
              NavMenuItem('Cartão', Icons.credit_card),
              NavMenuItem('Segurança', Icons.security),
              NavMenuItem('Me ajuda', Icons.help),
              NavMenuItem('Configurações', Icons.settings),
            ],
          ),
          OutlinedButton.icon(
            key: const Key('homePage_logout_iconButton'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(kPurple),
              foregroundColor: MaterialStateProperty.all<Color>(kLightGrey),
              fixedSize: MaterialStateProperty.all<Size>(Size(230, 30)),
            ),
            icon: const Icon(Icons.exit_to_app),
            label: Text('Sair'),
            onPressed: () => locator.get<AppBloc>().add(AppLogoutRequested()),
          ),
        ],
      ),
    );
  }
}
