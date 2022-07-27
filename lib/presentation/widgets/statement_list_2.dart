import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/constants.dart';

import '../bloc/statement/statement_bloc_2.dart';
import '../bloc/statement/statement_event.dart';
import '../bloc/statement/statement_state_2.dart';

class StatementList extends StatefulWidget {
  const StatementList({Key? key}) : super(key: key);

  @override
  State<StatementList> createState() => _StatementListState();
}

class _StatementListState extends State<StatementList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<StatementBloc>().add(const FetchStatement());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatementBloc, StatementState>(
      builder: (context, state) {
        if (state.states == States.empty) {
          return const Text('Empty');
        } else if (state.states == States.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.states == States.success) {
          return SingleChildScrollView(
            key: const Key('balance_data'),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: kDefaultPadding,
                    child: Text(
                      'Suas movimentações',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 250,
                      child: Timeline.tileBuilder(
                        controller: _scrollController,
                        builder: TimelineTileBuilder(
                          itemCount: state.hasReachedMax
                              ? state.statement.length
                              : state.statement.length + 1,
                          nodePositionBuilder: (context, index) => 0.05,
                          itemExtent: 120,
                          indicatorPositionBuilder: (context, index) => 0.3,
                          startConnectorBuilder: (context, index) =>
                              Connector.solidLine(
                            thickness: 1.8,
                            endIndent: 2,
                            color: const Color.fromARGB(255, 207, 207, 207),
                          ),
                          endConnectorBuilder: (context, index) =>
                              Connector.solidLine(
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
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : GestureDetector(
                                    onTap: () {},
                                    child: ListTile(
                                      contentPadding: kHorizontalPadding,
                                      tileColor: state
                                              .statement[index].description
                                              .contains('PIX')
                                          ? kLightGrey
                                          : null,
                                      enableFeedback: true,
                                      horizontalTitleGap: 0,
                                      minVerticalPadding: 0,
                                      minLeadingWidth: 0,
                                      style: ListTileStyle.list,
                                      title: Text(state
                                          .statement[index].description
                                          .toString()),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.statement[index].to ??
                                                state.statement[index].from
                                                    .toString(),
                                            style: const TextStyle(color: kDarkGrey),
                                            strutStyle:
                                                const StrutStyle(leading: 1.5),
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                                    symbol: 'R\$',
                                                    locale: 'PT_br',
                                                    decimalDigits: 2)
                                                .format(state
                                                    .statement[index].amount),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            strutStyle:
                                                const StrutStyle(leading: 1.5),
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
                      )),
                ]),
          );
        } else if (state.states == States.error) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
