import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:glistschallenge/services/auth_service.dart';
import 'package:glistschallenge/services/firestore_service/repo/tweet_repo.dart';
import 'package:glistschallenge/services/firestore_service/repo/user_repo.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService.internal();
  factory FirestoreService() => _instance;
  FirestoreService.internal();

  UserRepo _userRepo;
  TweetRepo _tweetRepo;

  UserRepo get userRepo {
    return _userRepo ??= UserRepo();
  }

  TweetRepo get tweetRepo {
    return _tweetRepo ??= TweetRepo();
  }
}
