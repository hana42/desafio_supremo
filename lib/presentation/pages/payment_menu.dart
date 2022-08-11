import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              // onPressed: () => MyRouter.popPage(context),
              icon: const Icon(Icons.close),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  PaymentMenu(
                    'Pagar com Pix',
                    'Leia um QR Code ou cole o código.',
                    Icons.qr_code,
                  ),
                  PaymentMenu(
                    'Pagar fatura do cartão',
                    'Libera o limite do seu Cartão de Crédito.',
                    Icons.payment,
                  ),
                  PaymentMenu(
                    'Pagar um boleto',
                    'Contas de luz, água, etc.',
                    Icons.receipt,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMenu extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onTap;

  const PaymentMenu(
    this.title,
    this.subTitle,
    this.icon, {
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Icon(icon, color: kPurple),
                const SizedBox(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 125,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subTitle,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward, color: kPurple),
          ],
        ),
      ),
    );
  }
}
