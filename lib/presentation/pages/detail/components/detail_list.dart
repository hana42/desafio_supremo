import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/widgets/bottom_loader.dart';
import 'package:desafio_supremo/presentation/pages/detail/components/detail_widget.dart';

import '../../../bloc/detail/detail_cubit.dart';

class DetailList extends StatefulWidget {
  final String id;
  const DetailList({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCubit, DetailState>(
      bloc: locator.get<DetailCubit>()..getDetail(widget.id),
      builder: (context, state) {
        if (state is DetailSuccess) {
          var detail = state.detail;

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailWidget(
                title: 'Tipo de movimentação',
                subtitle: detail.description.toString(),
              ),
              DetailWidget(
                title: 'Valor',
                subtitle: Utils().formatCurrency(detail.amount, detail.tType),
              ),
              DetailWidget(
                title: 'Recebedor',
                subtitle: detail.to ?? 'Sua Conta',
              ),
              DetailWidget(
                title: 'Instituição bancária',
                subtitle: detail.bankName ?? 'Nobank',
              ),
              DetailWidget(
                title: 'Data/Hora',
                subtitle: DateFormat(
                  'd/M/y - HH:mm:ss',
                ).format(detail.createdAt),
              ),
              DetailWidget(
                title: 'Autenticação',
                subtitle: detail.authentication,
              ),
            ],
          );
        }
        return const BottomLoader();
      },
    );
  }
}
