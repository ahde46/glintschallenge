import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:glistschallenge/pages/tweet_page/tweet_page.dart';
import 'package:glistschallenge/services/app_dialog.dart';
import 'package:glistschallenge/services/app_navigator.dart';
import 'package:glistschallenge/services/auth_service.dart';
import 'package:glistschallenge/services/firestore_service/firestore_service.dart';

abstract class HomePageView implements BaseView {}

class HomePagePresenter extends BasePresenter<HomePageView> {
  AuthService _authService = AuthService();
  FirestoreService _firestoreService = FirestoreService();

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Stream<List<Tweet>> getTweetsStream() {
    return _firestoreService.tweetRepo.tweetSnapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Tweet.fromSnapshot(doc)).toList(),
        );
  }

  Future<void> deleteTweet(Tweet tweet) async {
    AppDialog.confirmationDialog(
        context, "Are you sure you want to delete this tweet?", onConfirm: () {
      _firestoreService.tweetRepo.deleteTweet(tweet);
      AppDialog.toast("Tweet has been deleted.");
    });
  }

  Future<void> goTweetPage(Tweet tweet) async {
    await AppNavigator.cupertinoPush(
      context,
      TweetPage(
        tweet: tweet,
      ),
    );
  }
}
