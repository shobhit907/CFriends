import 'package:CFriends/index.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FriendsPage extends StatefulWidget {
  final List<String> friendsHandle;
  Function addFriendHandle, removeFriendHandle;
  FriendsPage(
      this.friendsHandle, this.addFriendHandle, this.removeFriendHandle);
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  static final CodeforcesService _cfService = CodeforcesService();
  static final DatabaseService _dbService = DatabaseService();
  TextEditingController _handleEntered = TextEditingController();

  Future<List<CFUser>> _giveFriends(BuildContext context) async {
    Future<List<CFUser>> _ret = _cfService.fetchUsers(widget.friendsHandle);
    return _ret;
  }

  Future _showDialog() async {
    Alert(
      context: context,
      title: "Add Friend",
      content: Column(
        children: <Widget>[
          TextField(
            controller: _handleEntered,
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: 'CF Handle',
              hintText: 'e.g. shobhit907',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () async {
            print(_handleEntered.value.text);
            if (_handleEntered.value.text != '') {
              print("Not empty");

              widget.addFriendHandle(_handleEntered.value.text);
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
                    onTap: (){},
                                      child: CfUserWidget(
                        snapshot.data[index], widget.removeFriendHandle),
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
          child: Icon(Icons.add_circle),
          onPressed: () async {
            _handleEntered.clear();
            await _showDialog();
          }),
    );
  }
}
