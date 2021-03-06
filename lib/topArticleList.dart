import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hacker_news/story.dart';
import 'package:hacker_news/webservice.dart';
import 'package:connectivity/connectivity.dart';

import 'commentListPage.dart';

class TopArticleList extends StatefulWidget {
  @override
  _TopArticleListState createState() => _TopArticleListState();
}

class _TopArticleListState extends State<TopArticleList> {
  List<Story> _stories = List<Story>();
  String result = '';

  @override
  void initState() {
    super.initState();

    checkStatus();
  }

  void _populateTopStories() async {
    final responses = await Webservice().getTopStories();
    final stories = responses.map((response) {
      final json = jsonDecode(response.body);
      return Story.fromJSON(json);
    }).toList();

    setState(() {
      _stories = stories;
    });
  }

  void _navigateToShowCommentsPage(BuildContext context, int index) async {
    final story = this._stories[index];
    final responses = await Webservice().getCommentsByStory(story);
    final comments = responses.map((response) {
      final json = jsonDecode(response.body);
      return Comment.fromJSON(json);
    }).toList();

    debugPrint("$comments");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CommentListPage(story: story, comments: comments)));
  }

  Widget check() {
    if (result != null) {
      return ListView.builder(
        itemCount: _stories.length,
        itemBuilder: (_, index) {
          return ListTile(
            onTap: () {
              _navigateToShowCommentsPage(context, index);
            },
            title: Text(_stories[index].title, style: TextStyle(fontSize: 20)),
            trailing: Container(
                decoration: BoxDecoration(
                    color: Colors.orange[900],
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                alignment: Alignment.center,
                width: 50,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("${_stories[index].commentIds.length}",
                      style: TextStyle(color: Colors.white)),
                )),
          );
        },
      );
    } else {
      return Center(
        child: Text('Please Connect to the Internet'),
      );
    }
  }

  checkStatus() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _populateTopStories();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hacker News"),
          backgroundColor: Colors.orange[900],
        ),
        body: check());
  }
}
