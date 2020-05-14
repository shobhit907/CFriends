import 'package:CFriends/index.dart';
import 'package:CFriends/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      // child: MaterialApp(home: Wrapper(),debugShowCheckedModeBanner: false,
      // ),
      child: Wrapper(),
    );
  }
}
