import 'package:CFriends/index.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static final AuthService _authService=AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      RaisedButton(onPressed: (){_authService.signOutGoogle();},
      child: Text("Sign out"),
      )
    );
  }
}