import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:CFriends/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    // getFriendsHandle();
  }

  AuthService _authService = AuthService();
  CodeforcesService _cfService = CodeforcesService();
  DatabaseService _dbService = DatabaseService();
  int _pageIndex = 0;
  static List<String> friendsHandle = ["shobhit907", "bit_show"];

  Future<List<String>> getFriendsHandle() async {
    User u = Provider.of<User>(context, listen: false);
    friendsHandle = await _dbService.getFriends(u);
    return friendsHandle;
  }

  void addFriendHandle(String _handle) async {
    User u = Provider.of<User>(context, listen: false);
    await _dbService.addFriend(u, _handle);
    setState(() {
      friendsHandle.add(_handle);
    });
  }

  void removeFriendHandle(String _handle) async {
    User u = Provider.of<User>(context, listen: false);
    await _dbService.removeFriend(u, _handle);
    setState(() {
      friendsHandle.remove(_handle);
    });
    print(friendsHandle);
  }

  List<Widget> _widgetOptions = [Loading(), Loading(), Loading()];
  // _widgetOptions[1]=FeedPage();

  @override
  Widget build(BuildContext context) {
    print("Building");
    if (_pageIndex == 0)
      _widgetOptions[0] =
          (FriendsPage(friendsHandle, addFriendHandle, removeFriendHandle));
    else if (_pageIndex == 1)
      _widgetOptions[1] = (FeedPage());
    else if (_pageIndex == 2) _widgetOptions[2] = (ProfilePage());
    return FutureBuilder<List<String>>(
        future: getFriendsHandle(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return FriendsPage([], addFriendHandle, removeFriendHandle);
          } else {
            friendsHandle = snapshot.data;
            _widgetOptions[0] =
                FriendsPage(friendsHandle, addFriendHandle, removeFriendHandle);
            return Scaffold(
              appBar: AppBar(
                title: Text("CFriends"),
                actions: <Widget>[
                  IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () async {
                        await getFriendsHandle();
                        print("Rebuild");
                        setState(() {});
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
        });
  }
}
