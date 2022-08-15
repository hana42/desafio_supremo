import 'package:flutter/material.dart';

import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../injection.dart';
import '../../bloc/app/app_bloc.dart';
import '../../shared/widgets/user_goals_list.dart';

import 'components/advertisement_card.dart';
import 'components/home_header.dart';
import 'components/home_nav_menu.dart';
import 'components/home_scrollable_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();
  final ScrollController scrollController = ScrollController();
  final ConfettiController confettiController = ConfettiController();

  int timesScrolled = 0;

  void setupScrollController(dynamic context) {
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
      appBar: AppBar(
        title: Text('Hello, ${FirebaseAuth.instance.currentUser!.displayName}'),
        centerTitle: false,
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('dsada'),
              accountEmail: Text('dhusiahd'),
            ),
            DrawerHeader(child: Text('aaa')),
            IconButton(
              key: const Key('homePage_logout_iconButton'),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => locator.get<AppBloc>().add(AppLogoutRequested()),
            ),
          ],
        ),
      ),
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
