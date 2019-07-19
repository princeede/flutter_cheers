import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ProvincialStats extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  ProvincialStats(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory ProvincialStats.withSampleData() {
    return new ProvincialStats(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  Widget dataCard(List<charts.Series> seriesList, String title){
    return Card(
      color: Colors.blueGrey[800],
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0,),
      child: Column(
        children: <Widget>[
          Text(title, style: TextStyle(fontFamily: "Oswald", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
          Container(
            height: 300,
            child: new charts.PieChart(seriesList,
              animate: animate,
              defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 50,
                  arcRendererDecorators: [new charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.inside)]),
              behaviors: [
                new charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.endDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 2,
                  cellPadding: new EdgeInsets.only(top:10, right: 4.0, bottom: 4.0),
                  entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.white,
                    fontFamily: 'Oswald',
                    fontSize: 11,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      children: <Widget>[
        dataCard(seriesList, "General"),
        dataCard(seriesList, "Male"),
        dataCard(seriesList, "Female")
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ProvincialZoneDate, String>> _createSampleData() {
    final data = [
      new ProvincialZoneDate("Zone A", 22, Colors.green),
      new ProvincialZoneDate("Zone E", 20, Colors.redAccent),
      new ProvincialZoneDate("Zone B", 18, Colors.orange),
      new ProvincialZoneDate("Zone C", 25, Colors.lightBlueAccent),
      new ProvincialZoneDate("Zone D", 15, Colors.pinkAccent),
    ];

    return [
      new charts.Series<ProvincialZoneDate, String>(
        id: 'Zones',
        domainFn: (ProvincialZoneDate zoneData, _) => zoneData.zone,
        measureFn: (ProvincialZoneDate zoneData, _) => zoneData.percent,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (ProvincialZoneDate zoneData, _) => '${zoneData.percent}',
        colorFn: (ProvincialZoneDate zoneData, _) => charts.ColorUtil.fromDartColor(zoneData.colorVal),
      )
    ];
  }
}

/// Sample linear data type.
class ProvincialZoneDate {
  final String zone;
  final double percent;
  final Color colorVal;

  ProvincialZoneDate(this.zone, this.percent, this.colorVal);
}
