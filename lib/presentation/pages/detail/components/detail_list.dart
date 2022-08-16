import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/injection.dart';
import '../../../bloc/detail/detail_cubit.dart';
import '../../../shared/theme/constants.dart';
import '../../../shared/widgets/bottom_loader.dart';
import '../../../shared/widgets/error_dialog.dart';

import 'detail_list_item.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailCubit, DetailState>(
      bloc: locator.get<DetailCubit>(),
      listener: (context, state) {
        if (state is DetailError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              margin: kDefaultPadding / 2,
              content: ErrorDialog(failure: state.failure),
            ),
          );
        }
      },
      child: BlocBuilder<DetailCubit, DetailState>(
        bloc: locator.get<DetailCubit>()..getDetail(widget.id),
        builder: (context, state) {
          if (state is DetailSuccess) {
            var detail = state.detail;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailListItem(
                  title: 'Tipo de movimentação',
                  subtitle: detail.description.toString(),
                ),
                DetailListItem(
                  title: 'Valor',
                  subtitle: Utils().formatCurrency(detail.amount, detail.tType),
                ),
                DetailListItem(
                  title: 'Recebedor',
                  subtitle: detail.to ?? 'Sua Conta',
                ),
                DetailListItem(
                  title: 'Instituição bancária',
                  subtitle: detail.bankName ?? 'Nobank',
                ),
                DetailListItem(
                  title: 'Data/Hora',
                  subtitle: DateFormat(
                    'd/M/y - HH:mm:ss',
                  ).format(detail.createdAt),
                ),
                DetailListItem(
                  title: 'Autenticação',
                  subtitle: detail.authentication,
                ),
              ],
            );
          } else {
            return const BottomLoader();
          }
        },
      ),
    );
  }
}
