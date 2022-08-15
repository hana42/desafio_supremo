import 'package:flutter/material.dart';

import 'package:screenshot/screenshot.dart';

import '../../../core/utils/utils.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/constants.dart';

import 'components/detail_list.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final ScreenshotController _screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Comprovante',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(
              color: kDarkGrey,
              indent: 15,
              endIndent: 15,
              thickness: 1.2,
            ),
            Expanded(
              child: Screenshot<Widget>(
                controller: _screenshotController,
                child: DetailList(id: widget.id),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final proof = await _screenshotController.capture();
                  Utils().saveAndShare(proof);
                },
                child: Padding(
                  padding: kButtonPadding,
                  child: Text(
                    'Compartilhar',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
