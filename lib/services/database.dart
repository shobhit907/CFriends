import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CFriends/index.dart';

class DatabaseService{
    static final CollectionReference users=Firestore.instance.collection('users');
    static final CodeforcesService _cfService=CodeforcesService();
    static final AuthService _authService=AuthService();
    Future addUser (User u)async{
        return await users.document(u.uid).setData({
          'uid':u.uid,
          'displayName':u.displayName,
          'email':u.email,
          'photoUrl':u.photoUrl,
          'cf_friends':u.friendsHandle,
        });
    }
    Future<bool> addFriend(User u,String handle)async{
        Pair<bool,String> _ret=await _cfService.userExists(handle);
        print(_ret);
        bool _exist=_ret.first;
        if(_exist){
          print(_ret.last);
              await users.document(u.uid).updateData({'cf_friends':FieldValue.arrayUnion([_ret.last])});
        }
        return _exist;
    }

    Future removeFriend(User u,String handle) async{
      await users.document(u.uid).updateData({'cf_friends':FieldValue.arrayRemove([handle])});
    }

    Future<List<String>> getFriends(User u) async{
        var _ret=await users.document(u.uid).get();
        return _ret.data['cf_friends'].toList().cast<String>();
    }

    Stream<DocumentSnapshot> changes(User u){
      return users.document(u.uid).snapshots();
    }
}