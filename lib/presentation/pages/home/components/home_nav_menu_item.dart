import 'package:flutter/material.dart';

import '../../../shared/theme/colors.dart';

class HomeNavMenuItem extends StatelessWidget {
  const HomeNavMenuItem(this.icon, this.name, this.page, {Key? key})
      : super(key: key);

  final IconData icon;
  final String name;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.push<void>(
                context,
                PageRouteBuilder<dynamic>(
                    opaque: false,
                    pageBuilder: (context, _, __) {
                      return page;
                    },
                    transitionsBuilder:
                        (___, Animation<double> animation, ____, Widget child) {
                      return SizeTransition(
                        sizeFactor: Tween<double>(begin: 0.5, end: 1.0)
                            .animate(animation),
                        child: child,
                      );
                    }));
            // Navigator.of(context).push(
            //   MaterialPageRoute(builder: (_) => page),
            // );
          },
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(top: 15),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            textStyle:
                Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
            primary: kDarkGrey,
            onSurface: kPurple,
            shadowColor: kLightGrey,
            elevation: 8,
            fixedSize: const Size(110, 110),
            side: const BorderSide(width: 1, color: kLightGrey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kLightGrey,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Icon(icon, color: kPurple, size: 28),
              ),
              Text(name),
            ],
          ),
        ),
      ],
    );
  }
}
