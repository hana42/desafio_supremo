import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/presentation/pages/pix/components/pix_menu_item.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          PixMenuItem(
            'Pagar com Pix',
            Icons.qr_code,
            subtitle: 'Leia um QR Code ou cole o código.',
          ),
          PixMenuItem(
            'Pagar fatura do cartão',
            Icons.payment,
            subtitle: 'Libera o limite do seu Cartão de Crédito.',
          ),
          PixMenuItem(
            'Pagar um boleto',
            Icons.receipt,
            subtitle: 'Contas de luz, água, etc.',
          ),
        ],
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
