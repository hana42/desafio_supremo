import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailList extends StatefulWidget {
  final String id;
  const DetailList({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      bloc: locator.get<DetailBloc>()..add(FetchDetail(widget.id)),
      builder: (context, state) {
        if (state is DetailEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DetailLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DetailHasData) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailWidget(
                title: 'Tipo de movimentação',
                subtitle: state.result.description.toString(),
              ),
              DetailWidget(
                title: 'Valor',
                subtitle: Utils().formatCurrency(state.result.amount),
              ),
              DetailWidget(
                title: 'Recebedor',
                subtitle: state.result.to ?? 'Sua Conta',
              ),
              DetailWidget(
                title: 'Instituição bancária',
                subtitle: state.result.bankName ?? '',
              ),
              DetailWidget(
                  title: 'Data/Hora',
                  subtitle: state.result.createdAt.toString()
                  // '13/10/2020 - 15:27:02',
                  ),
              DetailWidget(
                title: 'Autenticação',
                subtitle: state.result.authentication,
              ),
            ],
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
