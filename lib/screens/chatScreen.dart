import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superchat/screens/homescreen.dart';
import '../contants/colors.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.filler});
  final int filler;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messagetextController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  String uidIP = 'Unknown';
  String? textMessage;
  String tableData = "othersinterest";
  // bool isMECHECK=false;

  @override
  void initState() {
    initPlatformState();
    // TODO: implement initState
    super.initState();
    TableDatasetter();
  }

  void TableDatasetter() {
    if (widget.filler == 1) {
      tableData = "flutter";
    } else if (widget.filler == 2) {
      tableData = "sports";
    } else if (widget.filler == 3) {
      tableData = "javascript";
    } else if (widget.filler == 4) {
      tableData = "java";
    } else if (widget.filler == 5) {
      tableData = "food";
    } else if (widget.filler == 6) {
      tableData = "python";
    } else if (widget.filler == 7) {
      tableData = "sports";
    } else {
      tableData = "others";
    }
  }

  // Future<void> messageDelete() async {
  //   await for (var snapshot in _firestore.collection(tableData).do) {
  //     for (var messageST in snapshot.docs) {
  //       print(messageST.reference.delete());
  //     }
  //   }
  // }

  // Future<void> messageDelete() async {
  //   await for (var snapshot in _firestore.collection(tableData).snapshots()) {
  //     for (var messageST in snapshot.docs) {
  //       print(messageST.reference.delete());
  //     }
  //   }
  // }

  // if (_firestore
  //     .collection(tableData)
  //     .snapshots()
  //     .isEmpty == true) {

  Future<void> initPlatformState() async {

    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      dynamic data = await ipAddress.getIpAddress();
      setState(() {
        uidIP = data.toString();
      });
      if (kDebugMode) {
        print(data.toString());
      }
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      if (kDebugMode) {
        print(exception.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isME = false;
    return Scaffold(
      backgroundColor: Color(0xff141E27),
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Chat 🔥',
              style: GoogleFonts.sigmarOne(
                fontSize: 20,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Image.asset(
                'assets/exit.png',
                height: 40,
              ),
            ),
          ],
        ),
        elevation: 10,
        backgroundColor: const Color(0xff1b1b2f),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: _firestore
                    .collection(tableData)
                    .orderBy('time', descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        'Never to late to start a convo',
                        style: GoogleFonts.abel(color: Colors.white),
                      ),
                      // child: CircularProgressIndicator(
                      //   backgroundColor: Colors.blue,
                      // ),
                    );
                  }
                  final messages = snapshot.data?.docs.reversed;
                  List<MessageBubble> messageWidgets = [];
                  for (var message in messages!) {
                    final messageText = message.get('message');
                    final messageME = message.get('uid');
                    if (messageME == uidIP) {
                      isME = true;
                    } else {
                      isME = false;
                    }
                    final messageBubble =
                        MessageBubble(message: messageText, isMe: isME);
                    messageWidgets.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      children: messageWidgets,
                    ),
                  );
                }),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffD6E4E5),
                          borderRadius: BorderRadius.all(Radius.circular(55)),
                        ),
                        child: TextField(
                          controller: messagetextController,
                          onChanged: (value) {
                            textMessage = value;
                            //Do something with the user input.
                          },
                          decoration: kMessageTextFieldDecoration,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        messagetextController.clear();
                        if (textMessage != null) {
                          messagetextController.clear();
                          print(widget.filler);
                          _firestore.collection(tableData).add({
                            "message": textMessage,
                            "uid": uidIP,
                            'time': FieldValue.serverTimestamp()
                          });
                          //Implement send functionality.
                        }
                        textMessage = null;
                      },
                      child: Icon(
                        Icons.send,
                        color: Colors.lightGreen,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.message, required this.isMe});

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$message',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            color: isMe ? Color(0xFFE9D5CA) : Color(0xffF66B0E),
          ),
        ],
      ),
    );
  }
}
