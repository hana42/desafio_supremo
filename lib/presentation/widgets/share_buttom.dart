import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/text_styles.dart';
import '../pages/proof_page.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGrey,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Screenshot(
                controller: _screenshotController,
                child: Container(
                  color: Colors.white,
                  child: ProofComponent(
                    size: size,
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final proof = await _screenshotController.capture();
                    _saveAndShare(proof);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 64, vertical: 8),
                    child: Text(
                      "Compartilhar",
                      style: kTextButtom,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kPurple,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future _saveAndShare(Uint8List? proof) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/proof.png');
    image.writeAsBytesSync(proof!);
    await Share.shareFiles([image.path]);
  }
}
