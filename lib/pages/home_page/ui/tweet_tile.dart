import 'package:flutter/material.dart';
import 'package:glistschallenge/models/tweet.dart';
import 'package:intl/intl.dart';

class TweetTile extends StatelessWidget {
  final Tweet tweet;
  final Function(Tweet) onEdit;
  final Function(Tweet) onDelete;

  TweetTile(this.tweet, {this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      DateFormat("dd MMM yyyy h:mm a").format(tweet.createdAt)),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert),
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return ["Edit", "Delete"].map((String option) {
                        return PopupMenuItem<String>(
                          value: option,
                          child: Text(option),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              Text(tweet.text),
              tweet.updatedAt != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(DateFormat("dd MMM yyyy h:mm a")
                          .format(tweet.updatedAt)),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  void choiceAction(String action) async {
    switch (action) {
      case "Edit":
        if (onEdit != null) onEdit(tweet);
        break;
      case "Delete":
        if (onDelete != null) onDelete(tweet);
        break;
      default:
    }
  }
}
