import 'package:desafio_supremo/presentation/pages/backup/home_page.dart';
import 'package:desafio_supremo/presentation/pages/transfer_completed.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/theme/colors.dart';

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
                  "Transferindo",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 8,
                  ),
                  // child: TextMoneyEditWidget(
                  //   text: '',
                  //   onTap: () {},
                  // ),
                ),
                Text.rich(
                  TextSpan(
                    text: "para ",
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(
                        text: "PIX NAME",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                getRow(
                  "Quando",
                  "Agora",
                ),
                getRow(
                  "Forma de transferência",
                  "NOME Pix",
                ),
                getRow(
                  "CPF",
                  "NOME ***.xxx.xxx-**",
                ),
                getRow(
                  "Instituição",
                  "NOME INSTITUiÇÃO",
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => _showConfimrationDialog(context),
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
}

class NuInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool autoFocus;
  final String? hint;

  const NuInputField({
    this.controller,
    this.textInputType = TextInputType.text,
    this.autoFocus = false,
    this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            cursorColor: kPurple,
            autofocus: autoFocus,
            keyboardType: textInputType,
            textAlign: TextAlign.left,
            controller: controller,
            style: Theme.of(context).textTheme.bodyText1,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.subtitle1,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
          ),
          const Divider(
            height: 1,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}

_showConfimrationDialog(BuildContext context) {
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
          padding: EdgeInsets.symmetric(
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
              Text(
                "Transação realizada com sucesso!",
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
                child: Center(
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
