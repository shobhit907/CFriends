import 'package:CFriends/index.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  AuthService _authService=AuthService();
  
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner:false,
          theme:ThemeData.dark(),
          title: "CFriends",
              home: Scaffold(
            appBar: AppBar(
              leading: Image.asset("lib/images/logo.png"),
              title: Text("CFriends"),
            ),
            body: Center(
              child: GoogleSignInButton(
                onPressed:()async{
                  await  _authService.signInGoogle();
                  },
                darkMode:true,
                borderRadius: 10.0,
              ),
            ),
        ),
      );
  }
}