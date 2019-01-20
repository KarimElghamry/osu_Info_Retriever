import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey<AnimatedCircularChartState>();


class HitCountChart extends StatelessWidget{
  HitCountChart(this._playerData);

  var _playerData;

  @override
  Widget build(BuildContext context) {
    List<CircularStackEntry> data = <CircularStackEntry>[
    CircularStackEntry(
    <CircularSegmentEntry>[
      CircularSegmentEntry(double.parse(_playerData["count300"]), Color(0xffED5DA1), rankKey: '300'),
      CircularSegmentEntry(double.parse(_playerData["count100"]), Color(0xff168A94), rankKey: '100'),
      CircularSegmentEntry(double.parse(_playerData["count50"]), Color(0xffBFD8D1), rankKey: '50'),
    ],
    rankKey: 'Hit Count',
  ),
  ];

    return AnimatedCircularChart(
      key: _chartKey,
      size: const Size(300.0, 300.0),
      initialChartData: data,
      chartType: CircularChartType.Pie,
    );
  }
}
