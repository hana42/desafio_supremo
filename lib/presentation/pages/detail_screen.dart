import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/presentation/widgets/detail_list.dart';

import '../../core/theme/colors.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  const DetailScreen({Key? key, required this.id}) : super(key: key);

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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Container(
                color: Colors.white,
                child: DetailList(
                  id: widget.id,
                  size: size,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final proof = await _screenshotController.capture();
                  Utils().saveAndShare(proof);
                },
                style: ElevatedButton.styleFrom(
                  primary: kPurple,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
                  child: Text(
                    'Compartilhar',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
