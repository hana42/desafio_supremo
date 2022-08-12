import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';

class PixMenuItem extends StatelessWidget {
  const PixMenuItem(this.title, this.icon,
      {Key? key, this.subtitle, this.onTap})
      : super(key: key);

  final String title;
  final String? subtitle;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 3, color: Colors.transparent),
        ListTile(
          onTap: onTap,
          tileColor: kLightGrey,
          minLeadingWidth: 15,
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          iconColor: kPurple,
          trailing: const Icon(Icons.arrow_forward),
          title: Text(title, style: Theme.of(context).textTheme.bodyText2),
          subtitle: Text(subtitle ?? ''),
          leading: Icon(icon),
        ),
      ],
    );
  }
}
