import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:glistschallenge/pages/home_page/home_page_presenter.dart';
import 'package:glistschallenge/pages/home_page/ui/tweet_tile.dart';

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
        body: StreamBuilder<List<Tweet>>(
            stream: _presenter.getTweetsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    padding: EdgeInsets.only(bottom: 100),
                    itemBuilder: (context, i) {
                      Tweet tweet = snapshot.data[i];

                      return TweetTile(
                        tweet,
                        onEdit: _presenter.goTweetPage,
                        onDelete: _presenter.deleteTweet,
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _presenter.goTweetPage(null);
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
