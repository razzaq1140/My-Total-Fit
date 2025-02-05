import 'package:flutter/material.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SfModulesGraph extends StatefulWidget {
  const SfModulesGraph({super.key});

  @override
  State<SfModulesGraph> createState() => _SfModulesGraphState();
}

class _SfModulesGraphState extends State<SfModulesGraph> {
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
    final provider = Provider.of<OnboardingProvider>(context);
    double current = double.parse(provider.currentWeight);
    double target = double.parse(provider.targetWeight);
    double average = (current + target) / 2;
    double currentAvg = (current + average) / 2;
    double targetAvg = (average + target) / 2;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SfCartesianChart(
          margin: EdgeInsets.zero,

          plotAreaBorderWidth: 0,
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

          series: <CartesianSeries<WeightData, String>>[
            // Area series to create gradient fill below the line
            AreaSeries<WeightData, String>(
              dataSource: <WeightData>[
                WeightData('Today', current.toInt()),
                WeightData('1', currentAvg.toInt()),
                WeightData('2', average.toInt()),
                WeightData('3', targetAvg.toInt()),
                WeightData('July 2', target.toInt()),
              ],
              xValueMapper: (WeightData sales, _) => sales.date,
              yValueMapper: (WeightData sales, _) => sales.weight,
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
            LineSeries<WeightData, String>(
              dataLabelSettings: DataLabelSettings(
                color: colorScheme(context).surface,
                isVisible: true,
                labelAlignment: ChartDataLabelAlignment.top,
                textStyle: textTheme(context)
                    .labelSmall!
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                useSeriesColor: true,
              ),
              dataSource: <WeightData>[
                WeightData('Today', current.toInt()),
                WeightData('1', currentAvg.toInt()),
                WeightData('2', average.toInt()),
                WeightData('3', targetAvg.toInt()),
                WeightData('July 2', target.toInt()),
              ],
              xValueMapper: (WeightData sales, _) => sales.date,
              yValueMapper: (WeightData sales, _) => sales.weight,
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
              widget: AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Container(
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '$target ${provider.currentWeightText}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
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
              ),
              coordinateUnit: CoordinateUnit.point,
              x: 'July 2',
              y: target,
            ),
          ],
        ),
      ),
    );
  }
}

class WeightData {
  WeightData(this.date, this.weight);
  final String date;
  final int weight;
}
