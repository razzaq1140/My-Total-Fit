import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartSample extends StatefulWidget {
  const LineChartSample({super.key});

  @override
  State<LineChartSample> createState() => _LineChartSampleState();
}

class _LineChartSampleState extends State<LineChartSample> {
  late TooltipBehavior _tooltipBehavior;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _trackballBehavior = TrackballBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        color: Colors.red,
        borderWidth: 1.5,
        borderColor: Colors.white,
        textStyle: TextStyle(color: Colors.white),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: const CategoryAxis(
            isVisible: false,
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0),
          ),
          primaryYAxis: const NumericAxis(
            isVisible: false,
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0),
            minorGridLines: MinorGridLines(width: 0),
          ),
          // primaryXAxis: const CategoryAxis(),
          tooltipBehavior: _tooltipBehavior,
          trackballBehavior: _trackballBehavior,

          series: <CartesianSeries<SalesData, String>>[
            // Area series to create gradient fill below the line
            AreaSeries<SalesData, String>(
              dataSource: <SalesData>[
                SalesData('Today', 105),
                SalesData('1', 95),
                SalesData('2', 85),
                SalesData('3', 80),
                SalesData('July 2', 75),
              ],
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.weight,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red.withOpacity(0.2),
                  Colors.yellow.withOpacity(0.1),
                ],
              ),
            ),
            // Line series to create the red line on top
            LineSeries<SalesData, String>(
              dataLabelSettings: DataLabelSettings(
                color: colorScheme(context).surface,
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top,
                textStyle: const TextStyle(fontSize: 12, color: Colors.black),
                useSeriesColor: true,
              ),
              dataSource: <SalesData>[
                SalesData('Today', 105),
                SalesData('1', 95),
                SalesData('2', 85),
                SalesData('3', 80),
                SalesData('July 2', 75),
              ],
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.weight,
              color: Colors.red,
              width: 3,
              markerSettings: const MarkerSettings(
                height: 15,
                width: 15,
                isVisible: true,
                shape: DataMarkerType.circle,
                color: Colors.white,
                borderWidth: 5,
                borderColor: Colors.amber,
              ),
            ),
          ],
          annotations: <CartesianChartAnnotation>[
            CartesianChartAnnotation(
              widget: Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      '75 kg',
                      style: TextStyle(color: Colors.white),
                    ),
                    // const SizedBox(height: 20),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.amber,
                          width: 5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              coordinateUnit: CoordinateUnit.point,
              x: 'July 2',
              y: 75,
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.date, this.weight);
  final String date;
  final double weight;
}
