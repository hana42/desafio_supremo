import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/pages/home/components/home_header.dart';
import 'package:desafio_supremo/presentation/pages/home/components/home_nav_menu.dart';
import 'package:desafio_supremo/presentation/pages/home/components/home_scrollable_item.dart';
import 'package:desafio_supremo/presentation/widgets/advertisement_card.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();
  final ScrollController scrollController = ScrollController();
  final ConfettiController confettiController = ConfettiController();

  int timesScrolled = 0;

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        timesScrolled++;
        if (timesScrolled >= 5) {
          confettiController.play();
        }
      }
    });
  }

  @override
  void initState() {
    setupScrollController(context);
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Stack(
          children: [
            Column(
              children: const [
                HomeHeader(),
                HomeNavMenu(),
                AdvertisementCard(
                  'Empréstimo agora é 100% digital!',
                  'Agora ficou mais fácil conseguir seu empréstimo! Você faz tudo pelo app. Confira os convênios disponíveis e aproveite!',
                ),
                UserGoalsList(),
              ],
            ),
            HomeScrollableItem(confettiController: confettiController),
          ],
        ),
      ),
    );
  }
}
