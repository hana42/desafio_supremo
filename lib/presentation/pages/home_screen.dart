import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/widgets/advertisement_card.dart';
import 'package:desafio_supremo/presentation/widgets/home_header.dart';
import 'package:desafio_supremo/presentation/widgets/home_nav_menu.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomeHeader(),
            HomeNavigationMenu(),
            AdvertisementCard(),
            UserGoalsList()
          ],
        ),
      ),
    );
  }
}
