import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../../bloc/statement/statement_cubit.dart';
import '../../../shared/widgets/bottom_loader.dart';

import 'statement_connector.dart';

class StatementList extends StatefulWidget {
  const StatementList({Key? key}) : super(key: key);

  @override
  State<StatementList> createState() => _StatementListState();
}

class _StatementListState extends State<StatementList> {
  final StatementCubit cubit = locator.get<StatementCubit>();
  final ScrollController scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        cubit.getStatement();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setupScrollController(context);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatementCubit, StatementState>(
      bloc: cubit..getStatement(),
      builder: (context, state) {
        if (state is StatementLoaded) {
          return ListView.builder(
            controller: scrollController,
            itemExtent: MediaQuery.of(context).size.height * 0.16,
            itemBuilder: (context, index) {
              return index >= state.statements.length
                  ? const BottomLoader()
                  : StatementConnector(state.statements[index]);
            },
            itemCount: state.hasReachedMax
                ? state.statements.length
                : state.statements.length + 1,
          );
        } else {
          return const BottomLoader();
        }
      },
    );
  }
}
