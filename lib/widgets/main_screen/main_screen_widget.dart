import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget{
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Фильмы'),
    Text('Сериалы'),
    Text('ТВ Шоу')
  ];

  void onSelectedTab(int index) {
    if(_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Все о кино'),
      ),
      body: Center(
        child: _widgetOptions[_selectedTab]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie, color: Colors.white), label:"Фильмы"),
          BottomNavigationBarItem(icon: Icon(Icons.tv, color: Colors.white), label:"Сериалы",),
          BottomNavigationBarItem(icon: Icon(Icons.face, color: Colors.white), label:"ТВ Шоу"),

        ],
        onTap: onSelectedTab,
      ),
    );
  }
}

