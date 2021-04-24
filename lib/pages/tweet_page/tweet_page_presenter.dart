import 'package:flutter/material.dart';
import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';

abstract class TweetPageView implements BaseView {
  GlobalKey<FormState> formKey;
}

class TweetPagePresenter extends BasePresenter<TweetPageView> {
  String tweet;

  Future<void> sendTweet() async {
    if (view.formKey.currentState.validate()) {
      print("tweet $tweet");
    }
  }
}
