import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../shared/theme/colors.dart';
import '../../../../core/utils/utils.dart';
import '../../../../domain/entities/statement.dart';
import '../../detail/detail_screen.dart';

class StatementListItem extends StatelessWidget {
  const StatementListItem(this.statement, {Key? key}) : super(key: key);
  final Statement statement;

  isPix(String tType) {
    String cleanedString = tType.trim().toLowerCase();
    bool isPix = cleanedString.contains('pix');
    return isPix;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailScreen(id: statement.id),
            maintainState: true,
          ),
        );
      },
      minLeadingWidth: 0,
      minVerticalPadding: 10,
      contentPadding: const EdgeInsets.fromLTRB(45, 0, 15, 0),
      isThreeLine: true,
      tileColor: isPix(statement.tType) ? kLightGrey : null,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(statement.description),
          Visibility(
            visible: isPix(statement.tType),
            child: Container(
              color: kPurple,
              width: 50,
              height: 20,
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              child: Text(
                'Pix',
                style:
                    Theme.of(context).textTheme.button!.copyWith(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '${statement.from ?? statement.to}\n',
              style: Theme.of(context).textTheme.caption,
              children: <TextSpan>[
                TextSpan(
                  text:
                      Utils().formatCurrency(statement.amount, statement.tType),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Text(
            DateFormat('dd/MM').format(statement.createdAt),
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
