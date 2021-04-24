import 'package:flutter/material.dart';
import 'package:glistschallenge/pages/tweet_page/tweet_page_presenter.dart';
import 'package:glistschallenge/shared_widgets/buttons/long_button.dart';

class TweetPage extends StatefulWidget {
  final String tweetText;

  TweetPage({this.tweetText});

  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> implements TweetPageView {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TweetPagePresenter _presenter = TweetPagePresenter();
  bool isEdit = false;
  @override
  void initState() {
    _presenter.init(this, context);
    if (widget.tweetText != null) {
      isEdit = true;
      _presenter.tweet = widget.tweetText;
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
          title: Text(isEdit ? "Edit Tweet" : "Create Tweet"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      "What's on your mind?",
                      style: TextStyle(color: Colors.grey[500], fontSize: 22),
                    ),
                  ),
                  TextFormField(
                    initialValue: _presenter.tweet,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.newline,
                    maxLength: 280,
                    maxLines: 8,
                    decoration: InputDecoration(
                        isDense: true, hintText: "write something here..."),
                    onChanged: (String text) {
                      _presenter.tweet = text;
                    },
                    validator: (String text) {
                      if (text == null || text.isEmpty)
                        return 'Tweet can\'t be empty.';
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: LongButton(
                      child: Text(
                        isEdit ? "Save" : "Post",
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        _presenter.sendTweet();
                      },
                    ),
                  ),
                ],
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
