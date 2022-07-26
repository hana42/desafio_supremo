import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {

  const LoadingWidget({ Key? key,}) : super(key: key);

  

   @override
   Widget build(BuildContext context) {
       final screnSize = MediaQuery.of(context).size;

        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              
            ),
            alignment: Alignment.center,
            child: SizedBox(
              
              height: screnSize.height * .2,
              width: screnSize.width * .4,
              child: Lottie.asset('assets/lottie/progress.json'),
            ),
          ),
        );
  }
}
