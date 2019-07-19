//Dart Libs
//import 'dart:math';

//Plugins
import 'package:flutter/material.dart';
import 'package:date_utils/date_utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

//UIs
import '../UI/calender_drink_details.dart';
import '../UI/total_cumulative_drink.dart';

//Models
import '../models/CustomDrink.dart';
import '../models/Drink.dart';

//Pages
import '../pages/stats_page.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
//  DateTime(2019, 1, 1): ['New Year\'s Day'],
//  DateTime(2019, 1, 6): ['Epiphany'],
//  DateTime(2019, 2, 14): ['Valentine\'s Day'],
//  DateTime(2019, 4, 21): ['Easter Sunday'],
//  DateTime(2019, 4, 22): ['Easter Monday'],
};

class CalenderPage extends StatefulWidget {
  CalenderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> with TickerProviderStateMixin {
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  Map<DateTime, List> _visibleHolidays;
  List _selectedEvents;
  AnimationController _controller;

  CustomDrink hennessy = new CustomDrink(name: "Drink 1", volume: 50, percent: 45, price: 50);
  CustomDrink vodka = new CustomDrink(name: "Drink 2", volume: 40, percent: 25, price: 50);
  CustomDrink redLabel = new CustomDrink(name: "Drink 3", volume: 40, percent: 35, price: 50);
  CustomDrink blueLabel = new CustomDrink(name: "Drink 4", volume: 40, percent: 40, price: 50);
  CustomDrink andre = new CustomDrink(name: "Drink 5", volume: 50, percent: 5, price: 5);

  @override void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        new Drink( vodka,_selectedDay, _selectedDay.add(Duration(minutes: 30)), 0.5),
        new Drink( andre,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 1)), 1),
      ],
      _selectedDay.subtract(Duration(days: 27)): [
        new Drink( redLabel,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
        new Drink( andre,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
      _selectedDay.subtract(Duration(days: 20)): [
        new Drink( hennessy,_selectedDay, _selectedDay.add(Duration(minutes: 30)), 0.5),
      ],
      _selectedDay.subtract(Duration(days: 16)): [
        new Drink( hennessy,_selectedDay, _selectedDay.add(Duration(minutes: 30)), 0.5),
        new Drink( redLabel,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
      _selectedDay.subtract(Duration(days: 10)): [
        new Drink( hennessy,_selectedDay, _selectedDay.add(Duration(minutes: 30)), 0.5),
        new Drink( redLabel,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
        new Drink( andre,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        new Drink( hennessy,_selectedDay, _selectedDay.add(Duration(minutes: 30)), 0.5),
        new Drink( redLabel,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        new Drink( hennessy,_selectedDay, _selectedDay.add(Duration(minutes: 30)), 0.5),
        new Drink( redLabel,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
        new Drink( andre,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
      _selectedDay: [
        new Drink( hennessy,_selectedDay, _selectedDay.add(Duration(minutes: 30)), 0.5),
        new Drink( redLabel,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
      _selectedDay.add(Duration(days: 1)): [
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 0.5),
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 1),
      ],
      _selectedDay.add(Duration(days: 3)): Set.from([
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 1),
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 1),
        new Drink( andre,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
    ]).toList(),
      _selectedDay.add(Duration(days: 7)): [
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 2),
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 2),
      ],
      _selectedDay.add(Duration(days: 11)): [
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 2),
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 1)
      ],
      _selectedDay.add(Duration(days: 17)): [
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 3),
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 2),
        new Drink( andre,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
      _selectedDay.add(Duration(days: 22)): [
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 3),
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 1)
        ],
      _selectedDay.add(Duration(days: 26)): [
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 4),
        new Drink( hennessy,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(minutes: 30)), 3),
        new Drink( andre,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
        new Drink( vodka,_selectedDay.add(Duration(minutes: 30)), _selectedDay.add(Duration(hours: 50)), 1),
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;
    _visibleHolidays = _holidays;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      _visibleEvents = Map.fromEntries(
        _events.entries.where(
              (entry) =>
          entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );

      _visibleHolidays = Map.fromEntries(
        _holidays.entries.where(
              (entry) =>
          entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        // Switch out 2 lines below to play with TableCalendar's settings
        //-----------------------
//          _buildTableCalendar(),
        _buildTableCalendarWithBuilders(),
        const SizedBox(height: 8.0),
        new TotalCumulativeDrink(),
        const SizedBox(height: 8.0),
        Expanded(child: _buildEventList()),
      ],
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      locale: 'en_US',
      events: _visibleEvents,
      holidays: _visibleHolidays,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.twoWeeks: '2 weeks',
        CalendarFormat.week: 'Week',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.orange[400],
        todayColor: Colors.orange[200],
        markersColor: Colors.brown[700],
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.orange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'en_US',
      events: _visibleEvents,
      holidays: _visibleHolidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
        CalendarFormat.week: 'Week',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.orangeAccent),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
        weekdayStyle: TextStyle().copyWith(color: Colors.white),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.orangeAccent),
        weekdayStyle: TextStyle().copyWith(color: Colors.white),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        titleTextStyle: TextStyle().copyWith(color: Colors.white),
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white,),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white,),
        formatButtonVisible: true,
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.black, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.orange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.orange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _controller.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: events.length > 2//Utils.isSameDay(date, _selectedDay)
            ? Colors.redAccent
            : Colors.lightGreen, //Utils.isSameDay(date, DateTime.now()) ? Colors.brown[300] : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) =>
        new CalendarDrinkDetails(
          name: event.customDrink.name + " ",
          volume: event.customDrink.volume.toString() + "oz",
          percent: event.customDrink.percent.toString() + "%",
          price: "CAD " + event.customDrink.price(event.quantity).toString(),
          quantity: event.quantity.toString() + " bottles",
          startTime: (event.drinkDuration.inHours > 0 ? (event.drinkDuration.inHours.toString() + " hrs " + (event.drinkDuration.inMinutes/60).floor().toString()+ " mins" ) : event.drinkDuration.inMinutes.toString() + " mins"),),
//      )
      )
          .toList(),
    );
  }

  void goToChartsPage(){
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new StatsPage(title: "Charts",)));
  }

}
