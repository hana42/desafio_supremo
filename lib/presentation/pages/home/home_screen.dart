import 'package:flutter/material.dart';

import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'components/advertisement_card.dart';
import 'components/home_drawer.dart';
import 'components/home_header.dart';
import 'components/home_nav_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200]!,
        title: Text(
            'Olá, ${FirebaseAuth.instance.currentUser!.displayName ?? 'David'}.'),
        centerTitle: false,
      ),
      endDrawer: HomeDrawer(),
      body: SingleChildScrollView(
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
