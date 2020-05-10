import 'package:CFriends/index.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      CfFriendHandle _cfFriendHandle=CfFriendHandle();
      return ChangeNotifierProvider<CfFriendHandle>.value(
        value: _cfFriendHandle,
        child: FutureBuilder<List<String>>(builder: (context,AsyncSnapshot<List<String>> snapshot){
          if(snapshot.hasData){
            return Home();
          }else{
            return Loading();
          }
        } ,
        future: _cfFriendHandle.getFriendsHandle(),
        ),
      );
    }
  }
}
