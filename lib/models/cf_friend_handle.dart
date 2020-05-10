import 'package:CFriends/index.dart';

class CfFriendHandle with ChangeNotifier{
  List<String> friendsHandle=[];
  final DatabaseService _dbService = DatabaseService();
  bool reloadFriendsPage=false;
  void set(bool val){
    this.reloadFriendsPage=val;
  }
  bool get(){
    return this.reloadFriendsPage;
  }
  void addFriendHandle(String _handle) async{
    User _u=AuthService().userFromFirebaseUser(await FirebaseAuth.instance.currentUser());
    Pair<bool,String> _ret=await _dbService.addFriend(_u, _handle);
    if(_ret.first)
    this.friendsHandle.add(_ret.last);
    notifyListeners();
  }
  void removeFriendHandle(String _handle)async{
    print("Want to remove "+_handle);
     User _u=AuthService().userFromFirebaseUser(await FirebaseAuth.instance.currentUser());
    await _dbService.removeFriend(_u, _handle);
    this.friendsHandle.remove(_handle);
    notifyListeners();
  }
  Future<List<String>> getFriendsHandle() async {
     User _u=AuthService().userFromFirebaseUser(await FirebaseAuth.instance.currentUser());
    friendsHandle = await _dbService.getFriends(_u);
    return friendsHandle;
  }
}