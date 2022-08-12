import 'dart:io';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class Generate extends StatelessWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => GenerateQr()),
              );
            },
            child: const Text('Generate'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ScanQrPage()),
              );
            },
            child: const Text('Scan'),
          ),
        ],
      ),
    );
  }
}

class GenerateQr extends StatelessWidget {
  final qrKey = GlobalKey();
  final String qrData = 'Nobank';
  final ScreenshotController _screenshotController = ScreenshotController();

  GenerateQr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//RepaintBoundary is necessary for saving QR to user's phone
    return RepaintBoundary(
      key: qrKey,
      child: Padding(
        padding: kDefaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Screenshot(
                controller: _screenshotController,
                child: Center(
                  child: QrImage(
                    data: qrData,
                    size: 200,
                    backgroundColor: kLightGrey,
                    version: QrVersions.auto, //You can also give other versions
                  ),
                ),
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

class ScanQrPage extends StatefulWidget {
  const ScanQrPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      print(result!.code);
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    readQr();
    return Scaffold(
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: kPurple,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
