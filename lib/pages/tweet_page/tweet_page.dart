import 'package:flutter/material.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:glistschallenge/pages/tweet_page/tweet_page_presenter.dart';

class TweetPage extends StatefulWidget {
  final Tweet tweet;

  TweetPage({this.tweet});

  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> implements TweetPageView {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TweetPagePresenter _presenter = TweetPagePresenter();
  @override
  void initState() {
    _presenter.init(this, context);
    if (widget.tweet != null) {
      _presenter.isEdit = true;
      _presenter.tweet = widget.tweet;
    } else {
      _presenter.tweet = Tweet();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          .unfocus(), //tap everywhere to unfocus
      child: Scaffold(
        appBar: AppBar(
          title: Text(_presenter.isEdit ? "Edit Tweet" : "Create Tweet"),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () {
                _presenter.postTweet();
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  _presenter.isEdit ? "Save" : "Post",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 35),
            child: Form(
              key: formKey,
              child: TextFormField(
                initialValue: _presenter.tweet.text,
                textCapitalization: TextCapitalization.none,
                textInputAction: TextInputAction.newline,
                maxLength: 280,
                maxLines: 8,
                decoration: InputDecoration(
                    isDense: true, hintText: "What's on your mind..."),
                onChanged: (String text) {
                  _presenter.tweet.text = text;
                },
                validator: (String text) {
                  if (text == null || text.isEmpty) {
                    return 'Tweet can\'t be empty.';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void rebuildPage() {
    if (mounted) setState(() {});
  }
}
