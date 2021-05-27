import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/card/large_card_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttermvvmtemplate/core/components/card/mini_card.dart';
import 'package:fluttermvvmtemplate/core/constants/app/color_constants.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/detail/view/detail_view.dart';
import 'package:fluttermvvmtemplate/view/home/viewmodel/home_view_model.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel viewModel = HomeViewModel();
  final profile_photo_url =
      'https://avatars.githubusercontent.com/u/34376691?v=4';
  // final _scrollController = ScrollController(keepScrollOffset: true);
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailView(),
              ),
            );
            viewModel.increment();
          },
          backgroundColor: context.colors.onPrimary,
          child: Icon(
            Icons.add,
            color: context.colors.background,
            size: 30,
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              child: Container(
                color: context.colors.primary,
              ),
              height: context.mediaQuery.size.height * 0.4,
            ),
            Container(
              padding: context.paddingMedium,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Container(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(profile_photo_url))),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          viewModel.getDate(),
                          style: context.textTheme.button!.copyWith(
                              color: Color(ColorConstants.SILVER_RUST)),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'İyi Günler Abdullah 🙌',
                          style: context.textTheme.headline5,
                        )),
                  ),
                  Spacer(
                    flex: 10,
                  )
                ],
              ),
            ),
            LargeCardWidget(
              onTap: () {
                viewModel.changeDragbleScrollView(1);
              },
              left: context.mediaQuery.size.width * 0.06,
              top: context.mediaQuery.size.height * 0.310,
              child: Expanded(
                child: Padding(
                  padding: context.paddingLow,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: true,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        useRangeColorForAxis: true,
                        maximumLabels: 0,
                        showLastLabel: false,
                        labelOffset: context.mediaQuery.size.height * 0.06,
                        labelFormat: '%23',
                        axisLabelStyle:
                            GaugeTextStyle(fontWeight: FontWeight.w600),
                        axisLineStyle: AxisLineStyle(color: Color(0xFFF5F4F4)),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: 43.5,
                            width: 0.15,
                            color: Colors.red,
                            pointerOffset: 0.06,
                            cornerStyle: CornerStyle.bothCurve,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              text: '⏰ Yapılacaklar',
            ),
            LargeCardWidget(
              onTap: () {
                viewModel.changeDragbleScrollView(3);
              },
              top: context.mediaQuery.size.height * 0.570,
              left: context.mediaQuery.size.width * 0.06,
              text: '💦 Su',
              child: Expanded(
                  child: Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Bugünkü ihtiyacını karşılamak için',
                            style: context.textTheme.caption!.copyWith(
                                color: context.colors.onSecondary,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: ' 1.4',
                          style: context.textTheme.caption!.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: ' litre daha su içmelisin',
                          style: context.textTheme.caption!.copyWith(
                              color: context.colors.onSecondary,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                    ),
                  ],
                ),
              )),
            ),
            MiniCardWidget(
              onTap: () {
                viewModel.changeDragbleScrollView(2);
              },
              right: context.mediaQuery.size.height * 0.03,
              top: context.mediaQuery.size.height * 0.310,
              text: '📕 Kitap',
              child: Expanded(
                child: Container(
                  padding: context.paddingLow,
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 10,
                      barTouchData: BarTouchData(
                        enabled: false,
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.transparent,
                          tooltipPadding: const EdgeInsets.all(0),
                          tooltipMargin: 8,
                          getTooltipItem: (
                            BarChartGroupData group,
                            int groupIndex,
                            BarChartRodData rod,
                            int rodIndex,
                          ) {
                            return BarTooltipItem(
                              rod.y.round().toString(),
                              TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                              color: Color(0xff7589a2),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          margin: 20,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 0:
                                return 'Mn';
                              case 1:
                                return 'Te';
                              case 2:
                                return 'Wd';
                              case 3:
                                return 'Tu';
                              case 4:
                                return 'Fr';
                              case 5:
                                return 'St';
                              case 6:
                                return 'Sn';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(showTitles: false),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      barGroups: [
                        BarChartGroupData(
                          x: 0,
                          barRods: [
                            BarChartRodData(
                                y: 8, colors: [context.colors.primary])
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 1,
                          barRods: [
                            BarChartRodData(
                                y: 10, colors: [context.colors.primary])
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 2,
                          barRods: [
                            BarChartRodData(
                                y: 14, colors: [context.colors.primary])
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                                y: 15, colors: [context.colors.primary])
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                                y: 13, colors: [context.colors.primary])
                          ],
                          showingTooltipIndicators: [0],
                        ),
                        BarChartGroupData(
                          x: 3,
                          barRods: [
                            BarChartRodData(
                                y: 10, colors: [context.colors.primary])
                          ],
                          showingTooltipIndicators: [0],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            MiniCardWidget(
              onTap: () {
                viewModel.changeDragbleScrollView(4);
              },
              right: context.mediaQuery.size.height * 0.03,
              top: context.mediaQuery.size.height * 0.53,
              text: '💪 Spor',
              child: Expanded(
                  child: Container(
                      padding: context.paddingNormal,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(viewModel.sayi.toString(),
                              style: context.textTheme.bodyText1!
                                  .copyWith(fontWeight: FontWeight.w500)),
                          Text('Dakika',
                              style: context.textTheme.bodyText1!
                                  .copyWith(fontWeight: FontWeight.w500))
                        ],
                      ))),
            ),
            /*   DraggableScrollableSheet(
              initialChildSize: 0.165,
              minChildSize: 0.165,
              maxChildSize: 0.71,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  child: Container(
                    height: context.mediaQuery.size.height,
                    child: Observer(builder: (_) {
                      return viewModel.changePage(scrollController);
                    }),
                    decoration: scroolViewRadiusEffect(),
                  ),
                );
              },
            ) */
            DraggableScrollableSheet(
                initialChildSize: 0.165,
                maxChildSize: 1,
                minChildSize: 0.165,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: context.mediaQuery.size.height,
                          child: Observer(builder: (_) {
                            return viewModel.changePage(scrollController) ?? SizedBox();
                          }),
                          decoration: scroolViewRadiusEffect(),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  BoxDecoration scroolViewRadiusEffect() {
    return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 0.01,
          blurRadius: 14,
          offset: Offset(0, 0.1), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    );
  }
}

class TodoDragbleScrollViewBody extends StatelessWidget {
  ScrollController scrollController;
  TodoDragbleScrollViewBody(this.scrollController);
  final List todoList = [
    {
      'color': 0xffD87373,
      'name': 'Communis toplantısı',
      'isDone': true,
    },
    {
      'color': 0xff718DD6,
      'name': ' Proje lansmanı',
      'isDone': false,
    },
    {
      'color': 0xFF91720D,
      'name': 'Loggle backend geliştirmeleri',
      'isDone': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: context.colors.onSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            margin: context.paddingLowVertical,
            width: 80,
            height: 8,
          ),
        ),
        Padding(
          padding: context.paddingMediumHorizontal
              .copyWith(top: context.mediaQuery.size.height * 0.01),
          child: Text(
            '⏰  Yapılacaklar',
            style: context.textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: context.paddingLowHorizontal,
          child: ListView.builder(
            padding: context.paddingNormalVertical,
            shrinkWrap: true,
            controller: scrollController,
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: Color(todoList[index]['color']),
                      borderRadius: BorderRadius.circular(7)),
                  width: 25,
                  height: 25,
                ),
                trailing: todoList[index]['isDone'] != null
                    ? Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.watch_later,
                        color: Colors.red,
                      ),
                title: Text(
                  todoList[index]['name'].toString(),
                  style: context.textTheme.subtitle2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BookDragbleScrollViewBody extends StatelessWidget {
  ScrollController scrollController;
  BookDragbleScrollViewBody(this.scrollController);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: context.colors.onSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            margin: context.paddingLowVertical,
            width: 80,
            height: 8,
          ),
        ),
        Padding(
          padding: context.paddingMediumHorizontal
              .copyWith(top: context.mediaQuery.size.height * 0.01),
          child: Text(
            '📕  Kitap',
            style: context.textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 20,
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipMargin: 8,
                            getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                            ) {
                              return BarTooltipItem(
                                '${rod.y.round().toString()} sf',
                                TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                                color: Color(0xff7589a2),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            margin: 20,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'Mn';
                                case 1:
                                  return 'Te';
                                case 2:
                                  return 'Wd';
                                case 3:
                                  return 'Tu';
                                case 4:
                                  return 'Fr';
                                case 5:
                                  return 'St';
                                case 6:
                                  return 'Sn';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                  y: 8, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                  y: 10, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                  y: 14, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 15, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 13, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 10, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                padding: context.paddingNormalVertical,
                shrinkWrap: true,
                controller: scrollController,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Container(
                      child: Center(
                          child: Text('29 Şubat',
                              textAlign: TextAlign.center,
                              style: context.textTheme.button!
                                  .copyWith(color: Colors.white))),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(18)),
                      width: 50,
                      height: 50,
                    ),
                    trailing: Text('25 Sayfa'),
                    title: Text(
                      'deneme',
                      style: context.textTheme.subtitle2!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WaterDragbleScrollViewBody extends StatelessWidget {
  final HomeViewModel viewModel = HomeViewModel();
  ScrollController scrollController;
  WaterDragbleScrollViewBody(this.scrollController);

  @override
  Widget build(BuildContext context) {
    final Color barBackgroundColor = context.colors.primary;
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: context.colors.onSecondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)),
              margin: context.paddingLowVertical,
              width: 80,
              height: 8,
            ),
          ),
          Padding(
            padding: context.paddingMediumHorizontal
                .copyWith(top: context.mediaQuery.size.height * 0.01),
            child: Text(
              '💦  Su',
              style: context.textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: context.paddingLowHorizontal,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.7,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 20,
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipMargin: 8,
                            getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                            ) {
                              return BarTooltipItem(
                                rod.y.round().toString(),
                                TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                                color: Color(0xff7589a2),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            margin: 20,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'Mn';
                                case 1:
                                  return 'Te';
                                case 2:
                                  return 'Wd';
                                case 3:
                                  return 'Tu';
                                case 4:
                                  return 'Fr';
                                case 5:
                                  return 'St';
                                case 6:
                                  return 'Sn';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                  y: 8, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                  y: 10, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                  y: 14, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 15, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 13, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 10, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  padding: context.paddingNormalVertical,
                  shrinkWrap: true,
                  controller: scrollController,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Container(
                        child: Center(
                            child: Text('29 Şubat',
                                textAlign: TextAlign.center,
                                style: context.textTheme.button!
                                    .copyWith(color: Colors.white))),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(18)),
                        width: 50,
                        height: 50,
                      ),
                      trailing: Text('25 Sayfa'),
                      title: Text(
                        'deneme',
                        style: context.textTheme.subtitle2!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SportDragbleScrollViewBody extends StatelessWidget {
  ScrollController scrollController;
  SportDragbleScrollViewBody(this.scrollController);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: context.colors.onSecondary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            margin: context.paddingLowVertical,
            width: 80,
            height: 8,
          ),
        ),
        Padding(
          padding: context.paddingMediumHorizontal
              .copyWith(top: context.mediaQuery.size.height * 0.01),
          child: Text(
            '💪  Spor',
            style: context.textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.7,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 100,
                        barTouchData: BarTouchData(
                          enabled: false,
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipMargin: 8,
                            getTooltipItem: (
                              BarChartGroupData group,
                              int groupIndex,
                              BarChartRodData rod,
                              int rodIndex,
                            ) {
                              return BarTooltipItem(
                                '${rod.y.round().toString()} dk',
                                TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (value) => const TextStyle(
                                color: Color(0xff7589a2),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            margin: 20,
                            getTitles: (double value) {
                              switch (value.toInt()) {
                                case 0:
                                  return 'Mn';
                                case 1:
                                  return 'Te';
                                case 2:
                                  return 'Wd';
                                case 3:
                                  return 'Tu';
                                case 4:
                                  return 'Fr';
                                case 5:
                                  return 'St';
                                case 6:
                                  return 'Sn';
                                default:
                                  return '';
                              }
                            },
                          ),
                          leftTitles: SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(
                                  y: 8, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(
                                  y: 10, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(
                                  y: 60, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 15, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 13, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(
                                  y: 10, colors: [context.colors.primary])
                            ],
                            showingTooltipIndicators: [0],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                padding: context.paddingNormalVertical,
                shrinkWrap: true,
                controller: scrollController,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Container(
                      child: Center(
                          child: Text('29 Şubat',
                              textAlign: TextAlign.center,
                              style: context.textTheme.button!
                                  .copyWith(color: Colors.white))),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(18)),
                      width: 50,
                      height: 50,
                    ),
                    trailing: Text('25 Sayfa'),
                    title: Text(
                      'deneme',
                      style: context.textTheme.subtitle2!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
