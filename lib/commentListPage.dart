import 'package:flutter/material.dart';
import 'package:hacker_news/story.dart';

class CommentListPage extends StatelessWidget {
  final List<Comment> comments;
  final Story story;

  CommentListPage({this.story, this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Comments'), backgroundColor: Colors.orange[900]),
        //   title: Text(this.story.title), backgroundColor: Colors.orange[900]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                'Story',
                style: TextStyle(fontSize: 20, color: Colors.orange[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                this.story.title,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Text(
                'Comments',
                style: TextStyle(fontSize: 20, color: Colors.orange[700]),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  itemCount: this.comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.green[800],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text("${1 + index}",
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white))),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(this.comments[index].text,
                              style: TextStyle(fontSize: 18)),
                        ));
                  },
                ),
              ),
            ),
          ],
        )

        // Stack(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(top: 10.0, left: 20.0),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'Story',
        //             style: TextStyle(fontSize: 20, color: Colors.orange[700]),
        //           ),
        //           Text(
        //             this.story.title,
        //             style: TextStyle(fontSize: 30),
        //           ),
        //           ListView.builder(
        //             itemCount: this.comments.length,
        //             itemBuilder: (context, index) {
        //               return ListTile(
        //                   leading: Container(
        //                       alignment: Alignment.center,
        //                       width: 35,
        //                       height: 35,
        //                       decoration: BoxDecoration(
        //                           color: Colors.green[800],
        //                           borderRadius:
        //                               BorderRadius.all(Radius.circular(10))),
        //                       child: Text("${1 + index}",
        //                           style: TextStyle(
        //                               fontSize: 22, color: Colors.white))),
        //                   title: Padding(
        //                     padding: const EdgeInsets.only(top: 8.0),
        //                     child: Text(this.comments[index].text,
        //                         style: TextStyle(fontSize: 18)),
        //                   ));
        //             },
        //           ),
        //         ],
        //       ),
        //     ),
        //     // Padding(
        //     //   padding: const EdgeInsets.only(top: 100.0),
        //     //   child:
        //     // )
        //   ],
        // )

        );
  }
}
