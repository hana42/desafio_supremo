import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:flutter/material.dart';

class AdvertisementCard extends StatefulWidget {
  const AdvertisementCard({Key? key}) : super(key: key);

  @override
  State<AdvertisementCard> createState() => _AdvertisementCardState();
}

class _AdvertisementCardState extends State<AdvertisementCard> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Visibility(
      visible: isVisible,
      child: Card(
        color: kLightGrey,
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Empréstimo agora é 100% digital! 🎄',
                    style: Theme.of(context).textTheme.overline,
                  ),
                  IconButton(
                    onPressed: () => setState(() => isVisible = !isVisible),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width - 80,
                  maxHeight: size.height,
                ),
                child: Text(
                  'Agora ficou mais fácil conseguir seu empréstimo! Você faz tudo pelo app. Confira os convênios disponíveis e aproveite!',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
