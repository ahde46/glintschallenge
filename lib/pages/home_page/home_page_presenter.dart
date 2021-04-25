import 'package:glistschallenge/base/base_presenter.dart';
import 'package:glistschallenge/base/base_view.dart';
import 'package:glistschallenge/pages/login_page/login_page.dart';
import 'package:glistschallenge/services/app_navigator.dart';
import 'package:glistschallenge/services/auth_service.dart';

abstract class HomePageView implements BaseView {}

class HomePagePresenter extends BasePresenter<HomePageView> {
  AuthService _authService = AuthService();

  Future<void> signOut() async {
    await _authService.signOut();
  }

  Future<void> deleteTweet() async {}
}
