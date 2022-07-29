import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/injection.dart';

import 'package:desafio_supremo/presentation/bloc/statement/statement_bloc.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_event.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_state.dart';
import 'package:desafio_supremo/presentation/widgets/balance_widget.dart';

import '../widgets/statements_list.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Extrato'),
          centerTitle: true,
        ),
        body: Column(
          children: const [
            BalanceWidget(),
            Expanded(child: StatementBody()),
          ],
        ));
  }
}

class StatementBody extends StatefulWidget {
  const StatementBody({Key? key}) : super(key: key);

  @override
  State<StatementBody> createState() => _StatementBodyState();
}

class _StatementBodyState extends State<StatementBody> {
  final ScrollController _scrollController = ScrollController();
  int offset = 1;

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.offset;
    if (currentScroll == maxScroll) {
      locator.get<StatementBloc>().add(FetchStatement(offset));
      setState(() {
        offset = offset + 1;
      });
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: locator.get<StatementBloc>()..add(FetchStatement(offset)),
        builder: (context, state) {
          if (state is StatementEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StatementHasData) {
            if (state.statement.isEmpty) {
              return const Text('No Statements');
            }
            return StatementsList(
                scrollController: _scrollController, state: state);
          } else if (state is StatementError) {
            return const Center(child: Text('Error'));
          } else {
            return const Center(child: Text('caiu no else'));
          }
        });
  }
}
