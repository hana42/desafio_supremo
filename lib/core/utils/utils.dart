import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  formatCurrency(var number) {
    return NumberFormat.currency(locale: 'pt_BR', name: 'R\$').format(number);
  }

  saveAndShare(Uint8List? proof) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/proof.png');
    image.writeAsBytesSync(proof!);
    return await Share.shareFiles([image.path]);
  }
}
