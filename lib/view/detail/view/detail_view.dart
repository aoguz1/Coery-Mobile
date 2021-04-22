import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = 60.0;
    int itemCount = 100;
    int selected;
    int itemValue;
    FixedExtentScrollController _scrollController =
        FixedExtentScrollController(initialItem: 50);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.colors.onPrimary,
        child: Icon(
          Icons.done,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: context.paddingMedium,
              width: double.infinity,
              color: context.colors.primary,
              child: Column(
                children: [
                  Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Etkinlik Gir ⚡️',
                        style: context.textTheme.headline5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Yaptığın aktiviteleri girerek kolayca takip et !',
                        style: context.textTheme.subtitle1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SvgPicture.asset(
                                  'asset/svg/polygon_down.svg'),
                            ),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  color: Colors.indigo,
                                  child: RotatedBox(
                                      quarterTurns: -1,
                                      child: ListWheelScrollView(
                                        diameterRatio: 2,
                                        onSelectedItemChanged: (x) {
                                          setState(() {
                                            print(x);
                                            itemValue = selected = x;
                                          });
                                        },
                                        controller: _scrollController,
                                        children: List.generate(
                                            itemCount,
                                            (x) => RotatedBox(
                                                quarterTurns: 1,
                                                child: AnimatedContainer(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    width:
                                                        x == selected ? 60 : 50,
                                                    height:
                                                        x == selected ? 60 : 50,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: x == selected
                                                            ? Colors.red
                                                            : Colors.grey,
                                                        shape: BoxShape.circle),
                                                    child: Text('$x')))),
                                        itemExtent: itemWidth,
                                      )),
                                )),
                            Expanded(
                              flex: 1,
                              child:
                                  SvgPicture.asset('asset/svg/polygon_up.svg'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.brown,
                        child: PageView(
                          pageSnapping: false,
                          children: [
                            Container(
                              color: Colors.blueGrey,
                            ),
                            Container(
                              color: Colors.brown,
                            ),
                            Container(
                              color: Colors.deepPurpleAccent,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 6,
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
