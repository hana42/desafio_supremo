import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/constants.dart';
import '../../../widgets/credit_card.dart';
import 'block_card_alert.dart';

class CardsList extends StatefulWidget {
  const CardsList({Key? key}) : super(key: key);

  @override
  State<CardsList> createState() => _CardsListState();
}

class _CardsListState extends State<CardsList> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(maxHeight: size.height * 0.5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: kDefaultPadding / 2,
            child: Column(
              children: [
                const CreditCard(color: kPurple, vertical: true),
                OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        kPaddingButton),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(150, 30)),
                    maximumSize:
                        MaterialStateProperty.all<Size>(const Size(280, 50)),
                  ),
                  onPressed: () => showDialog<AlertDialog>(
                    context: context,
                    builder: (context) => const AlertDialog(content: BlockCardAlert()),
                  ),
                  child: const Text(
                    'Bloquear',
                    style: TextStyle(color: kBlack),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
