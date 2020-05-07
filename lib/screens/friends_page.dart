import 'package:CFriends/index.dart';
import 'package:CFriends/screens/cfuser_display.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  static final CodeforcesService _cfService = CodeforcesService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<CFUser>>(
        future: _cfService.fetchUsers(["shobhit907","roronoa_"]),
        builder: (context, AsyncSnapshot<List<CFUser>> snapshot) {
          if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (_,index){
              return CfUserWidget(snapshot.data[index]);
            });
          }else{
            return Loading();
          }
        },
      ),
    );
  }
}
