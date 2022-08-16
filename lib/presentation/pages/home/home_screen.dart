import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app/app_bloc.dart';
import '../../shared/theme/colors.dart';
import '../../shared/widgets/nav_menu_item.dart';

import 'components/advertisement_card.dart';
import 'components/home_header.dart';
import 'components/home_nav_menu.dart';

class HomeScreen extends StatelessWidget {
  static Page<void> page() => MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200]!,
        title: Text(
            'Olá, ${FirebaseAuth.instance.currentUser?.displayName ?? ''}.'),
        centerTitle: false,
      ),
      endDrawer: Drawer(
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
              onPressed: () =>
                  context.read<AppBloc>().add(AppLogoutRequested()),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: const [
            HomeHeader(),
            HomeNavMenu(),
            AdvertisementCard(
              'Empréstimo agora é 100% digital!',
              'Agora ficou mais fácil conseguir seu empréstimo! Você faz tudo pelo app. Confira os convênios disponíveis e aproveite!',
            ),
          ],
        ),
      ),
    );
  }
}
