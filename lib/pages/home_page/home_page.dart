import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/home_page/home_page_presenter.dart';
import 'package:glistschallenge/pages/home_page/ui/tweet_tile.dart';
import 'package:glistschallenge/pages/tweet_page/tweet_page.dart';
import 'package:glistschallenge/services/app_navigator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomePageView {
  HomePagePresenter _presenter = HomePagePresenter();

  @override
  void initState() {
    _presenter.init(this, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          .unfocus(), //tap everywhere to unfocus
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          elevation: 1,
          actions: [
            InkWell(
              onTap: () {
                _presenter.signOut();
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.only(bottom: 20),
            itemBuilder: (context, i) {
              return TweetTile(
                onEdit: () {
                  AppNavigator.cupertinoPush(
                    context,
                    TweetPage(
                      tweetText: "test",
                    ),
                  );
                },
                onDelete: () {
                  print("delete");
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AppNavigator.cupertinoPush(
              context,
              TweetPage(),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void rebuildPage() {
    if (mounted) setState(() {});
  }
}
