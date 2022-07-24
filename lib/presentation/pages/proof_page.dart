import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/theme/constants.dart';
import '../../core/theme/proof_constant.dart';
import '../../core/theme/text_styles.dart';

class ProofComponent extends StatelessWidget {
  final Size size;

  const ProofComponent({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat real =
        NumberFormat.currency(locale: "pt_BR", name: "R\$");

    return Column(
      children: [
        const SizedBox(height: 22),
        const Center(
          child: Text(
            'Comprovante',
            style: kHeader6,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          margin: kHorizontalPadding2,
          height: 1,
          color: Colors.black.withOpacity(0.4),
        ),
        const SizedBox(height: 28),
        Container(
          margin: kHorizontalPadding2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProofConstant(
                  text1: "Tipo de movimentação",
                  text2: "Transferência enviada",
                ),
                const SizedBox(height: 40),
                ProofConstant(
                  text1: "Valor",
                  text2: real.format(100),
                ),
                const SizedBox(height: 40),
                const ProofConstant(
                  text1: "Recebedor",
                  text2: "David Bond",
                ),
                const SizedBox(height: 40),
                const ProofConstant(
                  text1: "Instituição bancária",
                  text2: "Banco Phi",
                ),
                const SizedBox(height: 40),
                const ProofConstant(
                  text1: "Data/Hora",
                  text2: "13/10/2020 - 15:27:02",
                ),
                const SizedBox(height: 40),
                const ProofConstant(
                  text1: "Autenticação",
                  text2: "123445345",
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
