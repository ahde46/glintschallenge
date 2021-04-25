import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:glistschallenge/services/app_navigator.dart';
import 'package:glistschallenge/services/auth_service.dart';
import 'package:glistschallenge/services/firestore_service.dart';

abstract class TweetPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class TweetPagePresenter extends BasePresenter<TweetPageView> {
  FirestoreService _firestoreService = FirestoreService();

  bool isEdit = false;
  Tweet tweet;

  Future<void> postTweet() async {
    if (view.formKey.currentState.validate()) {
      if (isEdit) {
        tweet.updatedAt = DateTime.now();
      } else {
        tweet.createdAt = DateTime.now();
      }
      tweet.userUid = AuthService().getCurrentUserUid();

      //if await, offline mode will be stucked here..
      _firestoreService.upsertTweet(tweet);

      AppNavigator.back(context);
    }
  }
}
