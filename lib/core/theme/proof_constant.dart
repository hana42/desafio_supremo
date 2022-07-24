import 'package:flutter/cupertino.dart';

import 'text_styles.dart';

class ProofConstant extends StatelessWidget {
  final String text1;
  final String text2;
  const ProofConstant({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: kBodyTextBold,
        ),
        const SizedBox(height: 12),
        Text(
          text2,
          style: kSubtitle,
        )
      ],
    );
  }
}
