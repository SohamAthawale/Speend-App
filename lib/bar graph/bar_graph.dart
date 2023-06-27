import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:speend/bar%20graph/bar_data.dart';

class MyBargraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  const MyBargraph(
      {super.key,
      required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount,
      required this.maxY});

  @override
  Widget build(BuildContext context) {
    Bardata myBardata = Bardata(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    myBardata.intialiseBargraph();
    return BarChart(BarChartData(
      maxY: maxY,
      minY: 0,
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles:
                  SideTitles(showTitles: true, getTitlesWidget: bottomtitle))),
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      barGroups: myBardata.barData
          .map(
            (data) => BarChartGroupData(x: data.x, barRods: [
              BarChartRodData(
                  toY: data.y,
                  color: const Color.fromARGB(255, 121, 88, 115),
                  width: 25,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxY,
                    color: const Color.fromARGB(255, 58, 52, 62),
                  ))
            ]),
          )
          .toList(),
    ));
  }
}

Widget bottomtitle(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('S', style: style);
      break;
    case 1:
      text = const Text('M', style: style);
      break;
    case 2:
      text = const Text('T', style: style);
      break;
    case 3:
      text = const Text('W', style: style);
      break;
    case 4:
      text = const Text('T', style: style);
      break;
    case 5:
      text = const Text('F', style: style);
      break;
    case 6:
      text = const Text('S', style: style);
      break;
    default:
      text = const Text('S', style: style);
      break;
  }
  return SideTitleWidget(
    child: text,
    axisSide: meta.axisSide,
  );
}
