import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:flutter/material.dart';

class AdvertisementCard extends StatefulWidget {
  const AdvertisementCard(
    this.title,
    this.text, {
    Key? key,
    this.buttonText,
  }) : super(key: key);
  final String title;
  final String text;
  final String? buttonText;
  const AdvertisementCard({Key? key, required this.title, required this.text, this.buttonText}) : super(key: key);

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
        margin: kDefaultPadding,
        child: Padding(
          padding: kDefaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
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
                  widget.text,
                  maxLines: 5,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              widget.buttonText != null
                  ? ElevatedButton(
                      onPressed: () {}, child: Text(widget.buttonText!))
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
