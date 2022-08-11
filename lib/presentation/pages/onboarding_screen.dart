import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/pages/statement_screen.dart';
import 'package:desafio_supremo/presentation/widgets/choose_card.dart';
import 'package:desafio_supremo/presentation/widgets/create_pin.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const StatementScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Image(
      image: AssetImage(assetName),
      fit: BoxFit.cover,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
      //   return SizedBox(
      //     child: ShaderMask(
      //       shaderCallback: (rect) {
      //         return const LinearGradient(
      //           begin: Alignment.center,
      //           end: Alignment.bottomCenter,
      //           colors: [
      //             kBlack,
      //             Colors.transparent,
      //           ],
      //         ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      //       },
      //       blendMode: BlendMode.dstIn,
      //       child: child,
      //     ),
      //   );
      // },
      // loadingBuilder: (context, child, loadingProgress) {
      //   return Shimmer(
      //       gradient: const LinearGradient(
      //           begin: Alignment.topRight,
      //           end: Alignment.bottomLeft,
      //           colors: [
      //             Color.fromARGB(255, 214, 79, 81),
      //             Color.fromARGB(255, 214, 79, 79),
      //             kPurple,
      //             Color.fromARGB(255, 214, 79, 79),
      //             Color.fromARGB(255, 214, 79, 81),
      //           ],
      //           tileMode: TileMode.mirror),
      //       child: child);
      // },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          color: Colors.red,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      fullScreen: true,
      contentMargin: EdgeInsets.zero,
      titleTextStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w600, color: kDarkGrey),
      titlePadding: EdgeInsets.all(8),
      bodyTextStyle:
          TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: kBlack),
      imageFlex: 3,
      bodyPadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: const Color.fromARGB(255, 220, 220, 222),
      isTopSafeArea: true,
      globalHeader: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Text(
          'Nobank'.toUpperCase(),
          style: const TextStyle(
            letterSpacing: 1.7,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: kDarkGrey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      // globalFooter: Padding(
      //   padding: const EdgeInsets.all(12),
      //   child: Column(
      //     children: [
      //       GlassMorphism2(
      //         color: Colors.black,
      //         start: 0.9,
      //         end: 0.8,
      //         child: SizedBox(
      //           width: MediaQuery.of(context).size.width,
      //           height: MediaQuery.of(context).size.height * 0.09,
      //           child: OutlinedButton(
      //             child: const Text(
      //               'Começar',
      //               style: TextStyle(
      //                 fontSize: 16.0,
      //                 fontWeight: FontWeight.bold,
      //                 color: kLightGrey,
      //               ),
      //             ),
      //             onPressed: () => () => Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                       builder: (context) => const StatementScreen()),
      //                 ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: 'O primeiro banco \n que não é banco',
          body:
              'Faça parte da experiência nobank, \n totalmente online, sem piadas.',
          image: _buildImage('assets/images/onboarding_7.png'),
          decoration: pageDecoration,
        ),
        // PageViewModel(
        //   title: 'Planos',
        //   bodyWidget: const AccountTypes(),
        //   image: _buildImage('assets/images/onboarding_8.png'),
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          title: 'Escolha seu cartão',
          bodyWidget: const CardPicker(),
          decoration: pageDecoration.copyWith(bodyFlex: 7),
        ),
        PageViewModel(
          title: 'Crie um pin para seu cartão',
          bodyWidget: const CreatePin(),
          decoration: pageDecoration.copyWith(bodyFlex: 7),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showNextButton: true,
      showDoneButton: true,
      skip: const Text(
        'Pular',
        style: TextStyle(color: kBlack, fontWeight: FontWeight.w500),
      ),
      next: const Icon(Icons.arrow_forward_ios, color: kBlack),
      overrideDone: ElevatedButton(
        onPressed: () {},
        child: const Text(
            'Entrar',
            style: TextStyle(fontWeight: FontWeight.w500, color: kBlack),
          
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: kDefaultPadding,
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : kDefaultPadding,
      dotsDecorator: const DotsDecorator(
        spacing: kDefaultPadding,
        size: Size(6, 6),
        color: kDarkGrey,
        activeColor: kDarkGrey,
        activeSize: Size(32, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
      // dotsContainerDecorator: const BoxDecoration(color: Colors.transparent),
    );
  }
}
