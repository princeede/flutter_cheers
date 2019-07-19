/// Time series chart with line annotation example
///
/// The example future range annotation extends beyond the range of the series
/// data, demonstrating the effect of the [Charts.RangeAnnotation.extendAxis]
/// flag. This can be set to false to disable range extension.
///
/// Additional annotations may be added simply by adding additional
/// [Charts.RangeAnnotationSegment] items to the list.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
//import 'bac_percent.dart';

class TimeSeriesLineAnnotationChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  TimeSeriesLineAnnotationChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesLineAnnotationChart.withSampleData() {
    return new TimeSeriesLineAnnotationChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
//          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "0.055",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Oswald",
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "% BAC",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Oswald"),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                ],
              )
            ],
          ),
          Container(
            height: 350,
            padding: EdgeInsets.only(bottom: 20),
            child: new charts.TimeSeriesChart(
              seriesList,
              animate: animate,
              behaviors: [
                new charts.RangeAnnotation([
                  new charts.RangeAnnotationSegment(
                    new DateTime(2019, 7, 19, 10, 00, 00),
                    new DateTime(2019, 7, 19, 12, 00, 00),
                    charts.RangeAnnotationAxisType.domain,
                    color: charts.ColorUtil.fromDartColor(Colors.blueGrey[900]),
                  ),
                  new charts.LineAnnotationSegment(
                      0.055, charts.RangeAnnotationAxisType.measure,
                      endLabel: 'Can\'t drive',
                      color: charts.ColorUtil.fromDartColor(Colors.white),
                      labelStyleSpec: new charts.TextStyleSpec(
                        fontFamily: "Oswald",
                          color: charts.ColorUtil.fromDartColor(Colors.white))),
                ]),
              ],
              defaultRenderer: new charts.LineRendererConfig(
                  includeArea: true, includePoints: true),
              domainAxis: new charts.DateTimeAxisSpec(
                  tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
                      day: new charts.TimeFormatterSpec(
                          format: 'Hms', transitionFormat: 'E')),
                  renderSpec: new charts.SmallTickRendererSpec(
                      axisLineStyle: new charts.LineStyleSpec(
                          color: charts.ColorUtil.fromDartColor(Colors.white)),
                      labelStyle: new charts.TextStyleSpec(
                          color:
                              charts.ColorUtil.fromDartColor(Colors.white)))),
              primaryMeasureAxis: new charts.NumericAxisSpec(
                renderSpec: new charts.GridlineRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                      color: charts.ColorUtil.fromDartColor(Colors.white),
                    ),
                    lineStyle: new charts.LineStyleSpec(
                      color: charts.ColorUtil.fromDartColor(Colors.white12),
                    )),
                tickProviderSpec: new charts.StaticNumericTickProviderSpec([
                  charts.TickSpec(0),
                  charts.TickSpec(0.025),
                  charts.TickSpec(0.050),
                  charts.TickSpec(0.075)
                ]),
              ),
//                customSeriesRenderers: [
//                  new charts.SymbolAnnotationRendererConfig(
//                      customRendererId: 'drink_interval'
//                  )
//                ],
              dateTimeFactory: const charts.LocalDateTimeFactory(),
            ),
          )
        ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesBAC, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 10, 10, 00), 0),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 10, 20, 00), 0.01),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 10, 30, 00), 0.03),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 10, 40, 00), 0.06),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 10, 50, 00), 0.07),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 11, 00, 00), 0.06),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 11, 10, 00), 0.03),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 11, 24, 00), 0.02),
      new TimeSeriesBAC(new DateTime(2019, 7, 19, 11, 36, 00), 0.0),
    ];

    return [
      new charts.Series<TimeSeriesBAC, DateTime>(
        id: 'Sales',
        domainFn: (TimeSeriesBAC bac, _) => bac.time,
        measureFn: (TimeSeriesBAC bac, _) => bac.content,
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        data: data,
//        areaColorFn:
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesBAC {
  final DateTime time;
  final double content;

  TimeSeriesBAC(this.time, this.content);
}
