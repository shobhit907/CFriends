import 'package:CFriends/index.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn=GoogleSignIn();
  DatabaseService _database=DatabaseService();
  Future<User> signInGoogle() async{
    GoogleSignInAccount _googleUser=await _googleSignIn.signIn();
    GoogleSignInAuthentication _googleAuth=await _googleUser.authentication;
    final AuthCredential _authCredential =GoogleAuthProvider.getCredential(idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
    final AuthResult _authResult=await _firebaseAuth.signInWithCredential(_authCredential);
    final FirebaseUser user=_authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);
    // print(user);
    User _temp=_userFromFirebaseUser(currentUser);
    if(_authResult.additionalUserInfo.isNewUser){
      await _database.addUser(_temp);
    }
    return _temp;
  }

  User _userFromFirebaseUser(FirebaseUser _firebaseUser){
      return _firebaseUser==null?null:User(_firebaseUser.uid,_firebaseUser.displayName,_firebaseUser.email,_firebaseUser.photoUrl);
  }

  Stream<User> get user{
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signOutGoogle() async{
    await _googleSignIn.signOut();
    return await _firebaseAuth.signOut();
    // print("Sign out");
  }
}