import 'package:flutter/material.dart';

import '../../../core/error/error_object.dart';

import '../../../core/error/failure.dart';
import '../theme/colors.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key? key, required this.failure}) : super(key: key);
  final Failure failure;

  @override
  Widget build(BuildContext context) {
    final ErrorObject error = ErrorObject.mapFailureToError(failure: failure);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: kLightGrey, size: 26),
            SizedBox(width: 10),
            Text(error.title, textAlign: TextAlign.center),
          ],
        ),
        Text(error.message, textAlign: TextAlign.center),
      ],
    );
  }
}
