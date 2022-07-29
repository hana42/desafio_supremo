import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:desafio_supremo/core/utils/utils.dart';
import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/detail/detail_event.dart';
import 'package:desafio_supremo/presentation/widgets/detail_widget.dart';

import '../../core/theme/constants.dart';
import '../bloc/detail/detail_bloc.dart';
import '../bloc/detail/detail_state.dart';

class DetailList extends StatefulWidget {
  final Size size;
  final String id;
  const DetailList({Key? key, required this.id, required this.size})
      : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  void initState() {
    locator.get<DetailBloc>().add(FetchDetail(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      bloc: locator.get<DetailBloc>()..add(FetchDetail(widget.id)),
      builder: (context, state) {
        if (state is DetailEmpty) {
          return const Center(child: Text('Empty'));
        } else if (state is DetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DetailHasData) {
          return Container(
            margin: kHorizontalPadding2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailWidget(
                    title: 'Tipo de movimentação',
                    subtitle: state.result.description.toString(),
                  ),
                  const SizedBox(height: 40),
                  DetailWidget(
                    title: 'Valor',
                    subtitle: Utils().formatCurrency(state.result.amount),
                  ),
                  const SizedBox(height: 40),
                  DetailWidget(
                    title: 'Recebedor',
                    subtitle: state.result.to ?? '',
                  ),
                  const SizedBox(height: 40),
                  state.result.bankName != null
                      ? DetailWidget(
                          title: 'Instituição bancária',
                          subtitle: state.result.id.toString(),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 40),
                  DetailWidget(
                      title: 'Data/Hora',
                      subtitle: state.result.createdAt.toString()
                      // '13/10/2020 - 15:27:02',
                      ),
                  const SizedBox(height: 40),
                  DetailWidget(
                    title: 'Autenticação',
                    subtitle: state.result.authentication,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        } else if (state is DetailError) {
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
