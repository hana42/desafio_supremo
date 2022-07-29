import 'package:desafio_supremo/injection.dart';
import 'package:desafio_supremo/presentation/bloc/detail/detail_event.dart';
import 'package:desafio_supremo/presentation/widgets/proof_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/theme/constants.dart';
import '../bloc/detail/detail_bloc.dart';
import '../bloc/detail/detail_state.dart';

class ProofWidget extends StatefulWidget {
  const ProofWidget({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ProofWidget> createState() => _ProofWidgetState();
}

class _ProofWidgetState extends State<ProofWidget> {
  final NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

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
                  ProofConstant(
                    text1: 'Tipo de movimentação',
                    text2: state.result.description.toString(),
                  ),
                  const SizedBox(height: 40),
                  ProofConstant(
                    text1: 'Valor',
                    text2: real.format(state.result.amount),
                  ),
                  const SizedBox(height: 40),
                  ProofConstant(
                    text1: 'Recebedor',
                    text2: state.result.to ?? '',
                  ),
                  const SizedBox(height: 40),
                  state.result.bankName != null
                      ? ProofConstant(
                          text1: 'Instituição bancária',
                          text2: state.result.id.toString(),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(height: 40),
                  ProofConstant(
                      text1: 'Data/Hora',
                      text2: state.result.createdAt.toString()
                      // '13/10/2020 - 15:27:02',
                      ),
                  const SizedBox(height: 40),
                  ProofConstant(
                    text1: 'Autenticação',
                    text2: state.result.authentication,
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
