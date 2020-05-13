import 'package:CFriends/index.dart';
import 'package:CFriends/screens/feedback_widget.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    User _u = Provider.of<User>(context, listen: false);
    return Container(
      child: Center(
        child: ListView(
          children: <Widget>[
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_u.photoUrl),
                    radius: 50.0,
                  ),
                ),
              ),
            ),
            Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Welcome, " + _u.displayName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Divider(),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FeedbackWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
