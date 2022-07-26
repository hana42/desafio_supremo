import 'package:flutter/material.dart';

class ErrorConnectWidget extends StatelessWidget {

  
  
  const ErrorConnectWidget({Key? key, required this.error, required this.errorb}) : super(key: key);

  final String error;
  final String errorb;

  @override
  Widget build(BuildContext context) {
    final screnSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screnSize.height * .4,
              width: screnSize.width * .9,
              child: Image.asset('assets/images/error_image.png'),
            ),
            Text(
              error,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70, left: 70),
              child: Text(
                errorb,
                style: const TextStyle(
                  fontFamily: 'RobotoRegular',
                  fontSize: 17,
                  color: Color(0xFF747272),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
