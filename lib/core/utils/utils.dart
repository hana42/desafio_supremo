import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  /// Returns if statements is cash in or cash out
  bool statementType(String tType) {
    final String cleanedString = tType.trim().toLowerCase();
    final bool cashOut = cleanedString.contains('cashout') ||
        cleanedString.contains('realizada');
    return cashOut;
  }

  String formatCurrency(num number, [String type = 'cashin']) {
    final String currency = statementType(type) ? '- R\$' : 'R\$';
    return NumberFormat.currency(locale: 'pt_BR', name: currency)
        .format(number);
  }

  Future<void> saveAndShare(final Uint8List? proof) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File image = File('${directory.path}/proof.png')
      ..writeAsBytesSync(proof!);

    return Share.shareFiles([image.path]);
  }
}
