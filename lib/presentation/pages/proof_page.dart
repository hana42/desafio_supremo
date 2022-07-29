import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:desafio_supremo/presentation/widgets/proof_widget.dart';

import '../../core/theme/constants.dart';
import '../../core/theme/text_styles.dart';

class ProofPage extends StatefulWidget {
  final String id;

  const ProofPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ProofPage> createState() => _ProofPageState();
}

class _ProofPageState extends State<ProofPage> {
  final NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
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
          ProofWidget(id: widget.id)
        ],
      ),
    );
  }
}
