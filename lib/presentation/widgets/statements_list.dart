import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_state.dart';
import 'package:desafio_supremo/presentation/pages/proof_page.dart';
import 'package:desafio_supremo/presentation/widgets/bottom_loader.dart';

class StatementsList extends StatelessWidget {
  const StatementsList({
    Key? key,
    required this.scrollController,
    required this.state,
  }) : super(key: key);

  final ScrollController scrollController;
  final StatementHasData state;

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      controller: scrollController,
      builder: TimelineTileBuilder(
        itemCount: state.hasReachedMax
            ? state.statement.length
            : state.statement.length + 1,
        nodePositionBuilder: (context, index) => 0.05,
        itemExtent: 120,
        indicatorPositionBuilder: (context, index) => 0.3,
        startConnectorBuilder: (context, index) => Connector.solidLine(
          thickness: 1.8,
          endIndent: 2,
          color: const Color.fromARGB(255, 207, 207, 207),
        ),
        endConnectorBuilder: (context, index) => Connector.solidLine(
          thickness: 1.8,
          indent: 2,
          color: const Color.fromARGB(255, 207, 207, 207),
        ),
        indicatorBuilder: (context, index) => Indicator.dot(
          size: 10,
          color: kPurple,
        ),
        contentsAlign: ContentsAlign.basic,
        contentsBuilder: (context, index) {
          return index >= state.statement.length
              ? const BottomLoader()
              : GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProofPage(id: state.statement[index].id),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: kHorizontalPadding,
                    tileColor:
                        state.statement[index].description.contains('PIX')
                            ? kLightGrey
                            : null,
                    enableFeedback: true,
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    style: ListTileStyle.list,
                    title: Text(state.statement[index].description.toString()),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.statement[index].to ??
                              state.statement[index].from.toString(),
                          style: const TextStyle(color: kDarkGrey),
                          strutStyle: const StrutStyle(leading: 1.5),
                        ),
                        Text(
                          NumberFormat.currency(
                                  symbol: 'R\$',
                                  locale: 'PT_br',
                                  decimalDigits: 2)
                              .format(state.statement[index].amount),
                          style: Theme.of(context).textTheme.bodyText1,
                          strutStyle: const StrutStyle(leading: 1.5),
                        ),
                      ],
                    ),
                    trailing: Text(
                      '${state.statement[index].createdAt.day}/${state.statement[index].createdAt.month}',
                      style: const TextStyle(color: kDarkGrey),
                      strutStyle: const StrutStyle(leading: 2),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
