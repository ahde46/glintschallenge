import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepo {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> upsertUserData(User user) async {
    return await _userCollection.doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'photo_url': user.photoURL,
      'display_name': user.displayName,
      'last_seen': DateTime.now()
    }, SetOptions(merge: true));
  }
}
