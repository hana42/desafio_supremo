import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/theme/colors.dart';
import '../../home/home_screen.dart';

class TransferConfirmation extends StatelessWidget {
  const TransferConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: kBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transferindo',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 16,
                    bottom: 8,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Para ',
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                        text: 'Fulano',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                getRow(
                  'Quando',
                  '${DateTime.now().day}/${DateTime.now().month}',
                ),
                getRow(
                  'Forma de transferência',
                  'Fulano',
                ),
                getRow(
                  'CPF',
                  '***.***.***-05',
                ),
                getRow(
                  'Instituição',
                  'Banco XPTO',
                ),
              ],
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

  Widget getRow(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
          ),
          Text(
            text2,
          )
        ],
      ),
    );
  }

  _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 430,
          width: 327,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  width: 240,
                  height: 180,
                  // child: FittedBox(
                  child: Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_1snz9wmy.json',
                      fit: BoxFit.cover),

                  //   fit: BoxFit.fill,
                  // ),
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                    );
                  },
                  child: const Center(
                      child: Text(
                    'Voltar para Home',
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
