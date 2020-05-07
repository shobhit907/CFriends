import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:CFriends/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _authService = AuthService();
  int _pageIndex = 0;
  List<Widget> _widgetOptions = [FriendsPage(), FeedPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CFriends"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                print("Rebuild");
                setState(() {
                  _widgetOptions[_pageIndex]=Loading();
                  if (_pageIndex == 0) {
                    _widgetOptions[_pageIndex] = FriendsPage();
                  } else if (_pageIndex == 1) {
                    _widgetOptions[_pageIndex] = FeedPage();
                  } else if (_pageIndex == 2) {
                    _widgetOptions[_pageIndex] = ProfilePage();
                  }
                });
              })
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Friends'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.rss_feed),
              title: Text('Feed'),
              activeColor: Colors.pink),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              activeColor: Colors.blue),
        ],
        selectedIndex: _pageIndex,
        showElevation: true,
        curve: Curves.ease,
        onItemSelected: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      body: IndexedStack(
        children: _widgetOptions,
        index: _pageIndex,
      ),
    );
  }
}
