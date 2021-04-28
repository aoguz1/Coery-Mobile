import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluttermvvmtemplate/core/components/card/large_card_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttermvvmtemplate/core/components/card/mini_card.dart';
import 'package:fluttermvvmtemplate/core/constants/app/color_constants.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/detail/view/detail_view.dart';
import 'package:fluttermvvmtemplate/view/home/viewmodel/home_view_model.dart';

final HomeViewModel _viewModel = HomeViewModel();

class HomeView extends StatelessWidget {
  final profile_photo_url =
      'https://avatars.githubusercontent.com/u/34376691?v=4';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailView(),
            ),
          );
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
                        _viewModel.getDate(),
                        style: context.textTheme.button
                            .copyWith(color: Color(ColorConstants.SILVER_RUST)),
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
            top: context.mediaQuery.size.height * 0.570,
            left: context.mediaQuery.size.width * 0.06,
            text: '💦 Su',
            child: Expanded(
                child: Padding(
              padding: context.paddingLow,
              child: Text('DENMEE'),
            )),
          ),
          MiniCardWidget(
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
                  )),
            ),
          ),
          MiniCardWidget(
            right: context.mediaQuery.size.height * 0.03,
            top: context.mediaQuery.size.height * 0.53,
            text: '💪 Spor',
            child: Expanded(
                child: Container(
                    padding: context.paddingLow, child: Text('denemee'))),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.165,
              minChildSize: 0.165,
              maxChildSize: 0.71,
              builder: (context, scrollController) {
                return Container(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('index $index'),
                        );
                      }),
                  decoration: scroolViewRadiusEffect(),
                );
              }),
        ],
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
