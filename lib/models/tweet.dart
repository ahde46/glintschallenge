import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet {
  String id;
  String userUid;
  String text;
  DateTime createdAt;
  DateTime updatedAt;

  Tweet({this.id, this.userUid, this.text, this.createdAt, this.updatedAt});

  Tweet.fromSnapshot(QueryDocumentSnapshot snapshot) {
    id = snapshot.id;
    userUid = snapshot['user_uid'];
    text = snapshot['text'];
    createdAt = snapshot['created_at']?.toDate();
    updatedAt = snapshot['updated_at']?.toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_uid'] = this.userUid;
    data['text'] = this.text;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
