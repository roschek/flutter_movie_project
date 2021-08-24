import 'package:first_big_app/domains/data_providers/session_data_provider.dart';
import 'package:first_big_app/library/notify_provider.dart';
import 'package:first_big_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:first_big_app/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget{
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;
 final movieListModel = MovieListModel();


  void onSelectedTab(int index) {
    if(_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }
  void logout() {
    SessionDataProvider().setSessionId(null);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    movieListModel.loadMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Все о кино'),
        actions: [
          IconButton(
              onPressed: ()=> logout(),
              icon: Icon(Icons.logout))
        ],
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          NotifyProvider(model: movieListModel, child: MovieListWidget()),
          Text('Сериалы'),
          Text('ТВ Шоу')
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
          backgroundColor: Color.fromRGBO(3, 37, 65, 1),
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.movie, color: Colors.white), label:"Популярные"),
          BottomNavigationBarItem(icon: Icon(Icons.tv, color: Colors.white), label:"Сериалы",),
          BottomNavigationBarItem(icon: Icon(Icons.face, color: Colors.white), label:"ТВ Шоу"),

        ],
        onTap: onSelectedTab,
      ),
    );
  }
}

