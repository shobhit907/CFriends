import 'package:CFriends/index.dart';
import 'package:provider/provider.dart';

class WrapperNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("WrapperNext rebuilding");
    return FutureBuilder(
      future: Provider.of<CfFriendHandle>(context, listen: false)
          .getFriendsHandle(),
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return Loading();
        }
      },
    );
  }
}
