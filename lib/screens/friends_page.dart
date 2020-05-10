import 'package:CFriends/index.dart';
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
                    onTap: () {},
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
          child: Icon(Icons.add_circle),
          onPressed: () async {
            _handleEntered.clear();
            await _showDialog();
          }),
    );
  }
}
