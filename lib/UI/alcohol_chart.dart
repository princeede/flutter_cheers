import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AlcoholChart extends StatefulWidget {
  AlcoholChartState createState() => new AlcoholChartState();
}

class AlcoholChartState extends State<AlcoholChart> {
  List<charts.Series<TimeSeriesDrinks, DateTime>> seriesList;
  bool animate;

  AlcoholChartState();

  @override
  void initState() {
    super.initState();
    seriesList = _createSampleData();
    animate = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      height: 330,
      padding: EdgeInsets.only(bottom: 15),
      child: new charts.TimeSeriesChart(
        seriesList,
        animate: animate,
        defaultRenderer: new charts.BarRendererConfig<DateTime>(),
        defaultInteractions: false,
        behaviors: [
          new charts.SelectNearest(),
          new charts.DomainHighlighter(),
        ],
        domainAxis: new charts.DateTimeAxisSpec(
            tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
                day: new charts.TimeFormatterSpec(
                    format: 'd', transitionFormat: 'MMMd')),
            renderSpec: new charts.SmallTickRendererSpec(
                axisLineStyle: new charts.LineStyleSpec(
                    color: charts.ColorUtil.fromDartColor(Colors.white12)),
                labelStyle: new charts.TextStyleSpec(
                    color: charts.ColorUtil.fromDartColor(Colors.white)))),
        primaryMeasureAxis: new charts.NumericAxisSpec(
          renderSpec: new charts.GridlineRendererSpec(
              labelStyle: new charts.TextStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.white),
              ),
              lineStyle: new charts.LineStyleSpec(
                color: charts.ColorUtil.fromDartColor(Colors.white30),
              )),
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
              desiredMinTickCount: 4, desiredMaxTickCount: 10, zeroBound: true),
//                tickProviderSpec: new charts.StaticNumericTickProviderSpec([charts.TickSpec(0), charts.TickSpec(0.025), charts.TickSpec(0.050), charts.TickSpec(0.075)]),
        ),
      ),
    );
  }

  static List<charts.Series<TimeSeriesDrinks, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesDrinks(new DateTime(2019, 6, 1), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 2), 1),
      new TimeSeriesDrinks(new DateTime(2019, 6, 3), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 4), 3),
      new TimeSeriesDrinks(new DateTime(2019, 6, 5), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 6), 1),
      new TimeSeriesDrinks(new DateTime(2019, 6, 7), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 8), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 9), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 10), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 11), 3),
      new TimeSeriesDrinks(new DateTime(2019, 6, 12), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 13), 1),
      new TimeSeriesDrinks(new DateTime(2019, 6, 14), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 15), 1),
      new TimeSeriesDrinks(new DateTime(2019, 6, 16), 5),
      new TimeSeriesDrinks(new DateTime(2019, 6, 17), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 18), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 19), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 20), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 21), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 22), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 23), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 24), 1),
      new TimeSeriesDrinks(new DateTime(2019, 6, 25), 1),
      new TimeSeriesDrinks(new DateTime(2019, 6, 26), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 27), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 28), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 29), 0),
      new TimeSeriesDrinks(new DateTime(2019, 6, 30), 2),
      new TimeSeriesDrinks(new DateTime(2019, 6, 31), 2),
    ];

    return [
      new charts.Series(
        id: "Standard Drinks",
        data: data,
        domainFn: (TimeSeriesDrinks drinks, _) => drinks.time,
        measureFn: (TimeSeriesDrinks drinks, _) => drinks.drinks,
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      )
    ];
  }
}

class TimeSeriesDrinks {
  final DateTime time;
  final int drinks;

  TimeSeriesDrinks(this.time, this.drinks);
}
