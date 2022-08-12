import 'package:flutter/material.dart';

class DetailListItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailListItem({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyText2),
        Text(subtitle, style: Theme.of(context).textTheme.subtitle1)
      ],
    );
  }
}
