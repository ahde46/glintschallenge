import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:glistschallenge/services/auth_service.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService.internal();
  factory FirestoreService() => _instance;
  FirestoreService.internal();

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

  Stream<QuerySnapshot> tweetSnapshots() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(AuthService().getCurrentUserUid())
        .collection("tweets")
        .orderBy("created_at", descending: true)
        .snapshots();
  }

  Future<void> upsertTweet(Tweet tweet) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(AuthService().getCurrentUserUid())
        .collection("tweets")
        .doc(tweet.id)
        .set(tweet.toJson(), SetOptions(merge: true));
  }

  Future<void> deleteTweet(Tweet tweet) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(AuthService().getCurrentUserUid())
        .collection("tweets")
        .doc(tweet.id)
        .delete();
  }
}
