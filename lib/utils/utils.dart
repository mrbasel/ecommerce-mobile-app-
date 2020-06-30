import 'package:firebase_auth/firebase_auth.dart';


getCurrentUserEmail() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    print(currentUser.email);
    return currentUser.email;
  }