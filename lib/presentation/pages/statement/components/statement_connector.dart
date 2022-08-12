import 'package:flutter/material.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/domain/entities/statement.dart';
import 'package:desafio_supremo/presentation/pages/statement/components/statement_list_item.dart';

class StatementConnector extends StatelessWidget {
  const StatementConnector(this.statement, {Key? key}) : super(key: key);
  final Statement statement;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StatementListItem(statement),
        Positioned(
          left: kDefaultPadding.left,
          top: 0,
          bottom: 0,
          child: Container(
            width: 1,
            color: const Color(0xffBDBDBD),
          ),
        ),
        Positioned(
          left: kDefaultPadding.left - 5,
          top: kDefaultPadding.top + 25,
          child: const Icon(
            Icons.circle,
            size: 12,
            shadows: [
              Shadow(color: kLightGrey, offset: Offset(0, 2)),
              Shadow(color: kLightGrey, offset: Offset(0, -2)),
            ],
          ),
        ),
      ],
    );
  }
}
