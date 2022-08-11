import 'dart:io';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Utils {
  statementTType(String tType) {
    String cleanedString = tType.trim().toLowerCase();
    bool cashOut = cleanedString.contains('cashout') ||
        cleanedString.contains('realizada');
    return cashOut;
  }

  formatCurrency(num number, [String type = 'cashin']) {
    var currency = statementTType(type) ? '- R\$' : 'R\$';
    return NumberFormat.currency(locale: 'pt_BR', name: currency)
        .format(number)
        .toString();
  }

  saveAndShare(Uint8List? proof) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/proof.png');
    image.writeAsBytesSync(proof!);
    return await Share.shareFiles([image.path]);
  }
}
