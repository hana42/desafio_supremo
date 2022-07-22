import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/constants.dart';
import '../../core/theme/text_styles.dart';

class StatementsPage extends StatefulWidget {
  const StatementsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatementsPage> createState() => _StatementsPageState();
}

class _StatementsPageState extends State<StatementsPage> {
  final bool _pix = false;
  bool visible = true;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 7,
                width: MediaQuery.of(context).size.width,
                color: kLightGrey,
                padding: kHorizontalPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Seu saldo'),
                        IconButton(
                          icon: const Icon(Icons.remove_red_eye_rounded),
                          onPressed: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                        )
                      ],
                    ),
                    Visibility(
                      visible: visible ? true : false,
                      replacement: Divider(
                        thickness: 4,
                        color: kPurple,
                        endIndent: MediaQuery.of(context).size.width / 1.8,
                      ),
                      child: Text(
                        'R\$ 1.345,00',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: kDefaultPadding,
                child: Text(
                  'Suas movimentações',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              FixedTimeline.tileBuilder(
                builder: TimelineTileBuilder(
                  nodePositionBuilder: (context, index) => 0.05,
                  itemExtent: 120,
                  indicatorPositionBuilder: (context, index) => 0.3,
                  startConnectorBuilder: (context, index) =>
                      Connector.solidLine(
                    thickness: 1.8,
                    endIndent: 2,
                    color: const Color.fromARGB(255, 207, 207, 207),
                  ),
                  endConnectorBuilder: (context, index) => Connector.solidLine(
                    thickness: 1.8,
                    indent: 2,
                    color: const Color.fromARGB(255, 207, 207, 207),
                  ),
                  indicatorBuilder: (context, index) => Indicator.dot(
                    size: 10,
                    color: kPurple,
                  ),
                  contentsAlign: ContentsAlign.basic,
                  contentsBuilder: (context, index) => ListTile(
                    contentPadding: kHorizontalPadding,
                    tileColor: _pix ? kLightGrey : null,
                    enableFeedback: true,
                    horizontalTitleGap: 0,
                    minVerticalPadding: 0,
                    minLeadingWidth: 0,
                    style: ListTileStyle.list,
                    title: const Text(
                      'Transferência enviada',
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'David Bond',
                          strutStyle: StrutStyle(leading: 1.5),
                        ),
                        Text(
                          'R\$ 18,00',
                          style: Theme.of(context).textTheme.caption,
                          strutStyle: const StrutStyle(leading: 1.5),
                        ),
                      ],
                    ),
                    trailing: const Text(
                      '18/05',
                      strutStyle: StrutStyle(leading: 2),
                    ),
                  ),
                  itemCount: 10,
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
