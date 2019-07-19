import 'package:flutter/material.dart';

//UTILS

//Pages
import 'calender_page.dart';
import 'stats_page.dart';
import 'home_page.dart';
import 'resources_page.dart';
import 'help_page.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key key, this.title}) : super(key: key);

  final String title;

  LayoutPageState createState() => new LayoutPageState();
}

class LayoutPageState extends State<LayoutPage> with TickerProviderStateMixin {
  String title;
  Widget _bodyWidget;
  int _selectedIndex = 0;
  Widget tabBar;
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = "Cheers";
    _bodyWidget = new HomePage(
      title: title,
    );
    tabBar = null;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontFamily: "Oswald"),
        ),
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
        bottom: tabBar,
        actions: <Widget>[
//          IconButton(icon: Icon(Icons.healing, color: Colors.white,), onPressed: choiceAction),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return ["I need help", "Choice 2", "Choice 3"].map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Material(
        color: Colors.blueGrey[900], //300
        child: SafeArea(
          child: _bodyWidget,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontFamily: "Oswald"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text(
              'Logs',
              style: TextStyle(fontFamily: "Oswald"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            title: Text(
              'Stats',
              style: TextStyle(fontFamily: "Oswald"),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text(
              'Resources',
              style: TextStyle(fontFamily: "Oswald"),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        backgroundColor: Colors.blueGrey[700],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          title = "Cheers";
          tabBar = null;
          _bodyWidget = new HomePage(
            title: title,
          );
          break;
        case 1:
          title = "Diary";
          tabBar = null;
          _bodyWidget = new CalenderPage(
            title: title,
          );
          break;
        case 2:
          title = "Statistics";
          _tabController = TabController(length: 3, vsync: this);
          _bodyWidget = new StatsPage(
            title: title,
            controller: _tabController,
          );
          tabBar = TabBar(
            tabs: <Widget>[
              Tab(
                text: "Weekly",
              ),
              Tab(
                text: "Monthly",
              ),
              Tab(
                text: "Provincial",
              )
            ],
            controller: _tabController,
          );

          break;
        case 3:
          title = "Resources";
          _tabController = TabController(length: 2, vsync: this);
          tabBar = tabBar = TabBar(
            tabs: <Widget>[
              Tab(
                text: "Tips",
              ),
              Tab(
                text: "Quiz",
              ),
            ],
            controller: _tabController,
          );
          _bodyWidget = new ResourcesPage(controller: _tabController,);
          break;
        default:
          break;
      }
    });
  }

  void choiceAction(String choice){
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HelpPage()));
  }
}
