import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/utils.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/constants.dart';
import '../../detail/components/detail_list_item.dart';
import '../../home/home_screen.dart';

class TransferConfirmation extends StatelessWidget {
  const TransferConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: kDefaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Transferindo',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(
              color: kDarkGrey,
              indent: 15,
              endIndent: 15,
              thickness: 1.2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailListItem(
                    title: 'Tipo de movimentação',
                    subtitle: 'Transferência realizada',
                  ),
                  DetailListItem(
                    title: 'Valor',
                    subtitle: Utils().formatCurrency(500),
                  ),
                  DetailListItem(
                    title: 'Recebedor',
                    subtitle: 'David Bond',
                  ),
                  DetailListItem(
                    title: 'Instituição bancária',
                    subtitle: 'Nobank',
                  ),
                  DetailListItem(
                    title: 'Data/Hora',
                    subtitle: DateFormat(
                      'd/M/y - HH:mm:ss',
                    ).format(DateTime.now()),
                  ),
                  DetailListItem(
                    title: 'Autenticação',
                    subtitle: '4GFS89FD4S94SAFDSHGFDA4S5D6S5D4B',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => _showConfirmationDialog(context),
                  child: const Text('Confirmar'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showConfirmationDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: size.height * 0.6,
          width: size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  width: 240,
                  height: 180,
                  child: Lottie.network(
                    'https://assets5.lottiefiles.com/packages/lf20_1snz9wmy.json',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Transação realizada com sucesso!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 35),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  child: Text(
                    'Voltar para Home',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
