import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  final String category;
  const ChatRoom({
    Key? key,
    required this.category,
  }) : super(key: key);
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);
    // bool isDark = theme.getTheme() == ThemeData.dark() ? true : false;
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    // .doc(widget.category)
    // .collection('messageList');
    String message = "";
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: messages.orderBy('time').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }
              if (snapshot.data!.size == 0) {
                return const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      "No Chat found",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                child: ListView(
                  controller: _scrollController,
                  // reverse: true,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    String uid = FirebaseAuth.instance.currentUser!.uid;
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: uid == document['uid']
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: uid == document['uid']
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              decoration: BoxDecoration(
                                color: uid == document['uid']
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                      2,
                                      3,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: uid == document['uid']
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      document['message'],
                                      style: TextStyle(
                                        color: uid == document['uid']
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              document['email'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          TextFormField(
            scrollPadding: EdgeInsets.zero,
            controller: _textController,
            onChanged: (value) {
              message = value;
            },
            decoration: InputDecoration(
              labelText: "Send Message",
              suffix: IconButton(
                icon: const Icon(
                  Icons.send,
                  color: Colors.black,
                ),
                onPressed: () async {
                  CollectionReference messages =
                      FirebaseFirestore.instance.collection('messages');

                  messages.add({
                    'time': Timestamp.now(),
                    'message': message,
                    'uid': FirebaseAuth.instance.currentUser!.uid,
                    'email': FirebaseAuth.instance.currentUser!.email,
                    'category': widget.category,
                  });
                  _textController.clear();
                  message = "";
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
