import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const DetailWidget({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyText1),
        Text(subtitle),
      ],
    );
  }
}
