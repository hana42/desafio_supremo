import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_text.dart';

class SingleRowMenu extends StatelessWidget {
  const SingleRowMenu({super.key, this.onTap, this.iconUrl, this.text});

  final VoidCallback? onTap;
  final String? iconUrl;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsetsDirectional.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SvgPicture.asset(
              iconUrl!,
              color: Colors.blueGrey,
              width: 20,
            ),
          ),
        ),
        CustomText(
          text: text!,
          fontSize: 16,
          color: Colors.grey,
        )
      ],
    );
  }
}
