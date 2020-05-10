import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:CFriends/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;

  List<Widget> _widgetOptions = [FriendsPage(), FeedPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    if (Provider.of<CfFriendHandle>(context, listen: false).get()) {
      _widgetOptions[0] = FriendsPage();
      Provider.of<CfFriendHandle>(context, listen: false).set(false);
    }
    return Consumer<CfFriendHandle>(
      builder: (context, cfFriendHandle, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("CFriends"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () async {
                    if (_pageIndex == 0) {
                      await cfFriendHandle.getFriendsHandle();
                    }
                    setState(() {
                      if (_pageIndex == 0) {
                        _widgetOptions[0] = FriendsPage();
                      } else if (_pageIndex == 1) {
                        _widgetOptions[1] = FeedPage();
                      } else if (_pageIndex == 2) {
                        _widgetOptions[2] = ProfilePage();
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
      },
    );
  }
}
