import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/core/theme/constants.dart';
import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/domain/entities/statement.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/statement/statement_bloc.dart';
import 'package:desafio_supremo/presentation/pages/detail_screen.dart';
import 'package:desafio_supremo/presentation/pages/backup/balance_widget.dart';
import 'package:desafio_supremo/presentation/widgets/bottom_loader.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  final StatementCubit cubit = locator.get<StatementCubit>();
  final ScrollController scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        cubit.fetchStatement();
      }
    });
  }

  isPix(String tType) {
    String cleanedString = tType.trim().toLowerCase();
    bool isPix = cleanedString.contains('pix');
    return isPix;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extrato'),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BalanceWidget(),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: kDefaultPadding,
              child: Text(
                'Suas movimentações',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          Expanded(child: _statementBody()),
        ],
      ),
    );
  }

  Widget _statementBody() {
    return BlocBuilder<StatementCubit, StatementState>(
      bloc: cubit..fetchStatement(),
      builder: (context, state) {
        if (state is StatementLoaded) {
          return ListView.builder(
            controller: scrollController,
            itemExtent: MediaQuery.of(context).size.height * 0.16,
            itemBuilder: (context, index) {
              return index >= state.statements.length
                  ? const BottomLoader()
                  : _statementList(state.statements[index]);
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

  Widget _statementList(Statement statement) {
    return Stack(
      children: [
        _listTile(statement),
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

  Widget _listTile(Statement statement) {
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
