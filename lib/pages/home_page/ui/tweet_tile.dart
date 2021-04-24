import 'package:flutter/material.dart';

class TweetTile extends StatelessWidget {
  final Function onEdit;
  final Function onDelete;

  TweetTile({this.onEdit, this.onDelete});

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date here"),
                  PopupMenuButton<String>(
                    icon: Icon(Icons.more_vert),
                    onSelected: choiceAction,
                    itemBuilder: (BuildContext context) {
                      return ["Edit", "Delete"].map((String option) {
                        return PopupMenuItem<String>(
                          value: option,
                          child: Container(
                              alignment: Alignment.center,
                              width: 80,
                              child: Text(option)),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
              Text(
                  "He determined to drop his litigation with the monastry, and relinguish his claims to the wood-cuting and fishery rihgts at once. He was the more ready to do this becuase the rights had becom much less valuable, and he had indeed the vaguest idea where the wood and river in quedtion were")
            ],
          ),
        ),
      ),
    );
  }

  void choiceAction(String action) async {
    switch (action) {
      case "Edit":
        if (onEdit != null) onEdit();
        break;
      case "Delete":
        if (onDelete != null) onDelete();
        break;
      default:
    }
  }
}
