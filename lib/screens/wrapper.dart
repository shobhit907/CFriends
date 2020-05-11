import 'package:CFriends/index.dart';
import 'package:CFriends/screens/wrapper_next.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print(user.displayName);
    if (user == null) {
      return Authenticate();
    } else {
      return ChangeNotifierProvider<CfFriendHandle>(
        create: (context)=>CfFriendHandle(),
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          theme:ThemeData.dark(),
            home:WrapperNext(),
        ),
      );
    }
  }
}
