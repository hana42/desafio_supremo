import 'package:confetti/confetti.dart';
import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:desafio_supremo/presentation/pages/home/components/advertisement_card.dart';
import 'package:desafio_supremo/presentation/pages/home/components/home_header.dart';
import 'package:desafio_supremo/presentation/pages/home/components/home_nav_menu.dart';
import 'package:desafio_supremo/presentation/widgets/user_goals_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();
  final ConfettiController confettiController = ConfettiController();

  int easterEgg = 0;

  final ScrollController scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        easterEgg++;
        if (easterEgg > 5) {
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
                HomeNavigationMenu(),
                AdvertisementCard(
                  'Empréstimo agora é 100% digital!',
                  'Agora ficou mais fácil conseguir seu empréstimo! Você faz tudo pelo app. Confira os convênios disponíveis e aproveite!',
                ),
                UserGoalsList(),
              ],
            ),
            ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 50,
              gravity: 0.05,
              shouldLoop: true,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ],
              child: Visibility(
                visible: false,
                child: Container(
                  width: 400,
                  height: 400,
                  color: kLightGrey,
                  child: const Center(
                    child: Text(
                      'Parabéns',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
