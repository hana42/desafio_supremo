import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final String? userName;

  const CustomAppBar({super.key, required this.userName});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Hello, ',
              color: Colors.black,
              fontSize: 18,
            ),
            CustomText(
              text: userName!,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              width: 179,
            ),
            Icon(
              Icons.menu,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
