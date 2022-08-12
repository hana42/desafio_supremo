import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:flutter/material.dart';

class WidgetCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String price;
  final String time;

  
  const WidgetCard(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description,
      required this.price,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
      var we = MediaQuery.of(context).size.width;
      
    return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: kLightGrey),
          child: Icon(icon, color: kPurple),
        ),
        SizedBox(
          width: we * 0.03,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(color: kBlack),
            ),
            Text(description,
                style: TextStyle(color: kBlack.withOpacity(0.5)))
          ],
        ),
        SizedBox(
          width: we * 0.2,
        ),
        Column(
          children: [
            Text(
              price,
              style: const TextStyle(
                  color: kBlack, fontWeight: FontWeight.bold),
            ),
            Text(time, style: TextStyle(color: kBlack.withOpacity(0.5)))
          ],
        )
      ],
    ),
  );
  }
}