import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:glistschallenge/services/auth_service.dart';

class TweetRepo {
  CollectionReference _tweetCollection() => FirebaseFirestore.instance
      .collection("users")
      .doc(AuthService().getCurrentUserUid())
      .collection("tweets");

  Stream<QuerySnapshot> tweetSnapshots() {
    return _tweetCollection()
        .orderBy("created_at", descending: true)
        .snapshots();
  }

  Future<void> upsertTweet(Tweet tweet) async {
    return await _tweetCollection()
        .doc(tweet.id)
        .set(tweet.toJson(), SetOptions(merge: true));
  }

  Future<void> deleteTweet(Tweet tweet) async {
    return await _tweetCollection().doc(tweet.id).delete();
  }
}
