import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/pages/login_page/login_page.dart';
import 'package:glistschallenge/services/app_navigator.dart';

abstract class HomePageView implements BaseView {}

class HomePagePresenter extends BasePresenter<HomePageView> {
  Future<void> signOut() async {
    AppNavigator.pushAndRemoveUntil(
      context,
      LoginPage(),
    );
  }

  Future<void> deleteTweet() async {}
}
