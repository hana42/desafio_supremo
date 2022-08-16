import 'package:flutter/material.dart';

class DetailListItem extends StatelessWidget {
  const DetailListItem({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyText1),
        SizedBox(height: 5),
        Text(subtitle, style: Theme.of(context).textTheme.subtitle1)
      ],
    );
  }
}
