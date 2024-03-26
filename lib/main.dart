import 'package:flutter/material.dart';
import 'package:flutter_todolist_prac/tab_item.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  //_TodoListAppState의 인스턴스를 생성하여 StatefulWidget의 상태를 관리합니다.
  @override
  State<StatefulWidget> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  //_tabItems : TabItem 객체의 목록을 저장합니다. (제목, 아이콘)
  final List<TabItem> _tabItems = [
    TabItem("Todo", Icons.clear),
    TabItem("In Progress", Icons.loop),
    TabItem("Done", Icons.check),
  ];

  //현재 선택된 탭의 인덱스를 저장합니다.
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter TodoList Practice",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _tabItems[_currentTabIndex].getTitle(),
          ),
        ),
        bottomNavigationBar: _createBottomNavigationBar(),
      ),
    );
  }

  //BottomNavigationBar 위젯을 생성 및 반환합니다.
  //_tabItems에 따라 각 탭의 아이콘과 라벨을 생성합니다.
  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      items: _tabItems
          .map(
            (tabItem) => BottomNavigationBarItem(
                icon: Icon(tabItem.getIcon()), label: tabItem.getTitle()),
          )
          .toList(),
      currentIndex: _currentTabIndex,
      onTap: (int index) => {_onTabClick(index)},
    );
  }

  //탭 글릭 시 호출되는 콜백 함수입니다.
  //선택된 탭의 인덱스를 업데이트하고 setState를 호출하여 UI를 다시 그립니다.
  void _onTabClick(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }
}
