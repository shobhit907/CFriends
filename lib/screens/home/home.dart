import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:CFriends/index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pageIndex = 0;
  final AuthService _authService=AuthService();
  List<Widget> _widgetOptions = [FriendsPage(), FeedPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    if (Provider.of<CfFriendHandle>(context, listen: false).get()) {
      print("Build home under cffriendhandle provider");
        Provider.of<CfFriendHandle>(context, listen: false).set(false);
          Provider.of<CfFriendHandle>(context).getFriendsHandle();
      _widgetOptions[0] = FriendsPage();
    }
    return Consumer<CfFriendHandle>(
      builder: (context, cfFriendHandle, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("CFriends"),
            actions: <Widget>[
              IconButton(
                  icon:_pageIndex==2?Icon(Icons.exit_to_app): Icon(Icons.refresh),
                  tooltip: _pageIndex==2?"Sign Out":"Refresh",
                  onPressed: () async {
                    if (_pageIndex == 0) {
                      await cfFriendHandle.getFriendsHandle();
                    }
                    if(_pageIndex==2){
                      await _authService.signOutGoogle();
                    }
                    setState(() {
                      if (_pageIndex == 0) {
                        _widgetOptions[0] = FriendsPage();
                      } else if (_pageIndex == 1) {
                        _widgetOptions[1] = FeedPage();
                      }
                    });
                  })
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(50.0),
            ),
            child: BottomNavyBar(
              backgroundColor: HexColor("#1e1c21"),
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Friends'),
                  activeColor: HexColor("#7EDC50"),
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.rss_feed),
                    title: Text('Feed'),
                    activeColor: HexColor("#FDF04C"),
                    ),
                BottomNavyBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Profile'),
                    activeColor: HexColor("#2D66FC"),
                    ),
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
