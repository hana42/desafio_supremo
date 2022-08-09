import 'package:flutter/material.dart';
import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/widgets/glass_morphism.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({
    Key? key,
    required this.color,
    required this.vertical,
  }) : super(key: key);

  final Color color;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GlassMorphism(
      width: vertical ? size.width * 0.5 : size.width * 0.7,
      height: vertical ? size.height * 0.4 : size.height * 0.2,
      color: color,
      child: Padding(
        padding: kDefaultPadding,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/chip.png',
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(4.7),
                child: const Text(
                  'David Bond',
                  style: TextStyle(
                    color: kLightGrey,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    letterSpacing: 1.2,
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

class CreditCardBack extends StatelessWidget {
  const CreditCardBack({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
    required this.vertical,
  }) : super(key: key);

  final Color color;
  final double width;
  final double height;
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
        width: vertical ? width * 0.5 : width * 0.75,
        height: vertical ? height * 0.45 : height * 0.25,
        color: color,
        child: Padding(
            padding: kDefaultPadding,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Verso',
                      style: TextStyle(
                        color: kBlack.withOpacity(0.6),
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  )
                ])));
  }
  // Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     Align(
  //       alignment: Alignment.centerRight,
  //       child: Image.asset(
  //         'assets/images/onboarding_5.png',
  //         width: 20,
  //         height: 20,
  //         color: kPurple.withOpacity(0.9),
  //       ),
  //     ),
  //   ],
  // ),
  // Align(
  //   alignment: Alignment.bottomLeft,
  //   child: Image.asset(
  //     'assets/images/onboarding_3.png',
  //   ),
  // ),
//           ],
// =======
// import 'package:flutter_svg/svg.dart';

// import '../../core/theme/colors.dart';
// import '../../core/theme/themeStyles.dart';

// class CreditCard extends StatefulWidget {
//   @override
//   _CreditCardState createState() => _CreditCardState();
// }

// class _CreditCardState extends State<CreditCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[200],
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Container(
//           height: 216,
//           width: 380,
//           decoration: BoxDecoration(
//             color: primaryColor,
//             image: DecorationImage(
//                 image: AssetImage('assets/images/background2.jpg'),
//                 fit: BoxFit.cover),
//             // color: ThemeColors.black,
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24.0,
//                     vertical: 20.0,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('NoBank', style: ThemeStyles.cardMoney),
//                       Image.asset(
//                         'assets/images/logo.png',
//                         scale: 11,
//                         color: Colors.grey[400],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 24.0,
//                     bottom: 32.0,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('David Bond', style: ThemeStyles.cardDetails),
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 6.0),
//                             child:
//                                 SvgPicture.asset('assets/icons/card-dots.svg'),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 6.0),
//                             child:
//                                 SvgPicture.asset('assets/icons/card-dots.svg'),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 6.0),
//                             child:
//                                 SvgPicture.asset('assets/icons/card-dots.svg'),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 6.0),
//                             child: Text('9018', style: ThemeStyles.cardDetails),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 65),
//                             child:
//                                 Text('05/25', style: ThemeStyles.cardDetails),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
// >>>>>>> 300a1c0 (add-homepage)
//         ),
//       ),
//     );
//   }
// }
}
