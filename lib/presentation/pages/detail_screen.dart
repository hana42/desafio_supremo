import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/presentation/widgets/detail_list.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.id}) : super(key: key);

  final ScreenshotController _screenshotController = ScreenshotController();
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultPadding.copyWith(top: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Comprovante',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Divider(color: kDarkGrey, thickness: 0.8),
            Expanded(
              child: Screenshot(
                controller: _screenshotController,
                child: DetailList(id: id),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final proof = await _screenshotController.capture();
                Utils().saveAndShare(proof);
              },
              child: const Text('Compartilhar'),
            ),
          ],
        ),
      ),
    );
  }
}
