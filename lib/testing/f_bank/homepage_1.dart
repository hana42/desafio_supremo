import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:desafio_supremo/core/theme/colors.dart';
import 'package:desafio_supremo/testing/f_bank/card_animation.dart';
import 'package:desafio_supremo/testing/f_bank/card_info.dart';
import 'package:desafio_supremo/testing/f_bank/cards.dart';
import 'package:desafio_supremo/testing/f_bank/chart.dart';
import 'package:desafio_supremo/testing/f_bank/widget_cards.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({Key? key}) : super(key: key);

  @override
  State<Homepage1> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage1> with TickerProviderStateMixin {
  final PageController _controllerPage = PageController();
  AnimationController? _controller;
  late Animation<double> _rotection;
  AnimationController? _controllerprogress;
  Animation<double>? _prograsser;

  bool isOpen = true; // For show card info.

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _rotection = Tween(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.fastOutSlowIn));
    _controllerprogress = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800))
      ..addListener(() {
        setState(() {});
      });

    _prograsser = Tween(begin: 0.0, end: 0.6).animate(_controllerprogress!);
  }

  @override
  void dispose() {
    _controllerPage.dispose();
    _controller!.dispose();
    _controllerprogress!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPurple,
        elevation: 0,
        actions: [
          isOpen
              ? FadeAnimation(
                  delay: 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.drag_handle_outlined,
                          color: kBlack,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.07,
                      ),
                      const Text(
                        'HOME',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      SizedBox(
                        width: we * 0.45,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: kBlack,
                          size: 27,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.08,
                      ),
                    ],
                  ),
                )
              : FadeInDown(
                  duration: const Duration(milliseconds: 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _controller!.reverse();
                            _controllerprogress!.reset();
                            isOpen = true;
                          });
                        },
                        icon: const Icon(
                          Icons.close,
                          color: kBlack,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.07,
                      ),
                      const Text(
                        'CARD DETAILS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 1),
                      ),
                      SizedBox(
                        width: we * 0.3,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.swap_vert_outlined,
                          color: kBlack,
                          size: 27,
                        ),
                      ),
                      SizedBox(
                        width: we * 0.08,
                      ),
                    ],
                  ),
                )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: we,
          height: he,
          child: Stack(children: [
            SizedBox(
              height: he * 0.01,
            ),
            FadeAnimation(
              delay: 0.5,
              child: SizedBox(
                width: we * 2,
                height: he * 0.3,
                child: AnimatedBuilder(
                  animation: _controller!,
                  builder: (context, child) {
                    return PageView.builder(
                        controller: _controllerPage,
                        itemCount: cards.length,
                        clipBehavior: Clip.none,
                        physics: isOpen
                            ? const BouncingScrollPhysics()
                            : const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Transform.rotate(
                              angle: _rotection.value * pi / 180,
                              alignment: Alignment.lerp(Alignment.center,
                                  const Alignment(-.7, -.5), _controller!.value),
                              child: InkWell(
                                onTap: () {
                                  _controller!.forward();
                                  _controllerprogress!.forward();
                                  setState(() {
                                    isOpen = false;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(20),
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      gradient:
                                          LinearGradient(colors: cards[i].color)),
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: he * 0.1,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cards[i].title,
                                              style: const TextStyle(
                                                  color: kBlack,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                            SizedBox(
                                              height: he * 0.01,
                                            ),
                                            Text(
                                              cards[i].plan,
                                              style: const TextStyle(
                                                  color: kBlack,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: we * 0.35,
                                        ),
                                        Image.asset(
                                          cards[i].logo,
                                          color: kBlack,
                                          width: 70,
                                          height: 70,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: he * 0.08,
                                    ),
                                    Text(
                                      cards[i].number,
                                      style: const TextStyle(
                                          color: kBlack,
                                          fontSize: 22,
                                          letterSpacing: 1),
                                    )
                                  ]),
                                ),
                              ));
                        });
                  },
                ),
              ),
            ),
            isOpen
                ? Positioned(
                    left: we * 0.45,
                    top: he * 0.32,
                    child: FadeAnimation(
                      delay: 0.6,
                      child: SmoothPageIndicator(
                        controller: _controllerPage,
                        count: cards.length,
                        effect: const WormEffect(
                          activeDotColor: kBlack,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    left: 150,
                    top: 40,
                    child: FadeInRight(
                      duration: const Duration(milliseconds: 400),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            const Center(
                              child: Text('3/5',
                                  style: TextStyle(
                                      color: kBlack, letterSpacing: 1)),
                            ),
                            CircularProgressIndicator(
                              value: _prograsser!.value,
                              strokeWidth: 4,
                              valueColor:
                                  const AlwaysStoppedAnimation(Color(0xFFFF00FF)),
                              backgroundColor: kDarkGrey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            isOpen
                ? Positioned(
                    left: we * 0.01,
                    height: he * 0.75,
                    child: FadeAnimation(
                      delay: 0.7,
                      child: SizedBox(
                        width: we * 1,
                        height: he * 0.09,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Transactions',
                              style: TextStyle(
                                  color: kBlack,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: we * 0.5,
                            ),
                            const Icon(Icons.sort_outlined, color: kBlack)
                          ],
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    left: we * 0.4,
                    top: he * 0.17,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInRight(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              '\$ ${(_prograsser!.value * 8900).round()}',
                              style: const TextStyle(
                                  color: kBlack,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: he * 0.05,
                        ),
                        FadeInRight(
                          duration: const Duration(milliseconds: 600),
                          child: Row(
                            children: [
                              Icon(
                                Icons.credit_card_outlined,
                                color: kBlack.withOpacity(0.4),
                                size: 28,
                              ),
                              SizedBox(
                                width: we * 0.04,
                              ),
                              const Text('Bank card',
                                  style: TextStyle(
                                    color: kBlack,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: he * 0.02),
                        FadeInRight(
                          duration: const Duration(milliseconds: 700),
                          child: Row(
                            children: [
                              Icon(Icons.payments_outlined,
                                  color: kBlack.withOpacity(0.4), size: 28),
                              SizedBox(
                                width: we * 0.04,
                              ),
                              const Text('Bank account',
                                  style: TextStyle(
                                    color: kBlack,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: he * 0.02),
                        FadeInRight(
                          duration: const Duration(milliseconds: 800),
                          child: Row(
                            children: [
                              Icon(Icons.paid_outlined,
                                  color: kBlack.withOpacity(0.4), size: 28),
                              SizedBox(
                                width: we * 0.04,
                              ),
                              const Text('Pay',
                                  style: TextStyle(
                                    color: kBlack,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    )),
            SizedBox(height: we * 0.01),
            isOpen
                ? Positioned(
                    top: he * 0.43,
                    child: FadeAnimation(
                      delay: 0.8,
                      child: SizedBox(
                        width: we * 1,
                        height: he * 0.4,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: we * 0.05),
                                child: Text(
                                  'Yesterday',
                                  style: TextStyle(
                                      color: kBlack.withOpacity(0.7),
                                      fontSize: 12),
                                ),
                              ),
                              const WidgetCard(
                                description: 'Entertainment',
                                icon: Icons.apple,
                                price: '- 500.00 USD',
                                time: '09:20 AM',
                                title: 'iTunes',
                              ),
                              Container(
                                margin: EdgeInsets.only(left: we * 0.26),
                                width: we * 0.67,
                                child: Divider(
                                  color: kBlack.withOpacity(0.5),
                                ),
                              ),
                              const WidgetCard(
                                icon: Icons.payment,
                                description: 'Entertainment',
                                time: '9:20 AM',
                                price: '- 450.00 USD',
                                title: 'GooglePay',
                              ),
                              Container(
                                margin: EdgeInsets.only(left: we * 0.05),
                                child: Text(
                                  '17 Sep 2020',
                                  style: TextStyle(
                                      color: kBlack.withOpacity(0.7),
                                      fontSize: 12),
                                ),
                              ),
                              
                              const WidgetCard(
                                icon: Icons.payment,
                                title: 'Amazon',
                                description: 'Entertainment',
                                price: '- 200.00 USD',
                                time: '02:10 AM',
                              ),
                              Container(
                                margin: EdgeInsets.only(left: we * 0.26),
                                width: we * 0.67,
                                child: Divider(
                                  color: kBlack.withOpacity(0.5),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                : Positioned(
                    left: we * 0.07,
                    top: he * 0.51,
                    child: Column(
                      children: [
                        const Items(),
                        BounceInDown(child: const Chart())
                      ],
                    ),
                  )
          ]),
        ),
      ),
    );
  }
}
