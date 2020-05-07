import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:CFriends/index.dart';

class DatabaseService{
    static final CollectionReference users=Firestore.instance.collection('users');
    Future addUser (User u)async{
        return await users.document(u.uid).setData({
          'uid':u.uid,
          'displayName':u.displayName,
          'email':u.email,
          'photoUrl':u.photoUrl,
          'cf_friends':u.friendsHandle,
        });
    }
    Future addFriend(User u,String handle)async{
        await users.document(u.uid).updateData({'cf_friends':FieldValue.arrayUnion([handle])});
    }
}