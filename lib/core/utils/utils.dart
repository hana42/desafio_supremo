import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  bool statementType(String tType) {
    final String cleanedString = tType.trim().toLowerCase();
    final bool isCashOut = cleanedString.contains('cashout') ||
        cleanedString.contains('realizada');
    return isCashOut;
  }

  String formatCurrency(num number, [String type = 'cashin']) {
    final String currency = statementType(type) ? '- R\$' : 'R\$';
    return NumberFormat.currency(locale: 'pt_BR', name: currency)
        .format(number);
  }

  Future<void> saveAndShare(final Uint8List? file) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File image = File('${directory.path}/${DateTime.now()}.png')
      ..writeAsBytesSync(file!);

    return Share.shareFiles([image.path]);
  }
}
