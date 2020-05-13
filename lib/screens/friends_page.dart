import 'package:CFriends/index.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  static final CodeforcesService _cfService = CodeforcesService();
  TextEditingController _handleEntered = TextEditingController();

  Future<List<CFUser>> _giveFriends(BuildContext context) async {
    Future<List<CFUser>> _ret = _cfService
        .fetchUsers(Provider.of<CfFriendHandle>(context).friendsHandle);
    return _ret;
  }

  Future _showDialog() async {
    Alert(
      style: AlertStyle(),
      context: context,
      title: "Add Friend",
      content: Column(
        children: <Widget>[
          TextField(
            controller: _handleEntered,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.lightGreen,
              ),
              icon: Icon(
                Icons.account_circle,
                color: Colors.lightGreenAccent,
              ),
              labelText: 'CF Handle',
              hintText: 'e.g. shobhit907',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          color: Colors.lightGreen,
          onPressed: () async {
            if (_handleEntered.value.text != '') {
              Provider.of<CfFriendHandle>(context, listen: false).set(true);
              Provider.of<CfFriendHandle>(context, listen: false)
                  .addFriendHandle(_handleEntered.value.text);
            }
            return Navigator.pop(context);
          },
          child: Text(
            "ADD",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
      closeFunction: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CfFriendHandle>(context).friendsHandle);
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<CFUser>>(
          future: _giveFriends(context),
          builder: (context, AsyncSnapshot<List<CFUser>> snapshot) {
            if (snapshot.hasData) {
              snapshot.data
                  .sort((user1, user2) => user2.cfRating - user1.cfRating);
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: CFUserSubmission(
                                handle: snapshot.data[index].cfHandle,
                              ),
                              type: PageTransitionType.rotate,
                              curve: Curves.easeInSine,
                              alignment: Alignment.topRight));
                      // Navigator.push(
                      //     _,
                      //     MaterialPageRoute(
                      //         builder: (_) => CFUserSubmission(
                      //               handle: snapshot.data[index].cfHandle,
                      //             )));
                    },
                    child: CfUserWidget(
                      snapshot.data[index],
                    ),
                  );
                },
              );
            } else {
              return Loading();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(
            Icons.person_add,
            color: Colors.white,
          ),
          tooltip: "Add friend",
          elevation: 10.0,
          
          onPressed: () async {
            _handleEntered.clear();
            await _showDialog();
          }),
    );
  }
}
