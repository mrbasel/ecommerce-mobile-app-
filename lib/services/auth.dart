import 'package:ecom_app/models/models.dart';
import 'package:ecom_app/services/firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  QuerySnapshot querySnapshots = await Firestore.instance.collection("users").getDocuments();
  for (DocumentSnapshot doc in querySnapshots.documents) {
    // check if logged in user is in db
    if (doc.data['email'] == currentUser.email){
      return 'signInWithGoogle succeeded: $user';

    }
    
  }
  // Add new user to db 
  User newUser = User(name: currentUser.displayName, email: currentUser.email);
  addUser(newUser);
  return 'New user added: $user';

}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}