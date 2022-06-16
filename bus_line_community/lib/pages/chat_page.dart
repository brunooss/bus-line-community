import 'dart:convert';

import 'package:bus_line_community/components/message_component.dart';
import 'package:bus_line_community/models/message.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = <Message>[];
  String messageText = "";
  bool canSendMessage = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final CollectionReference dbMessages = FirebaseFirestore.instance.collection('S50');
  final Stream<QuerySnapshot> _dbMessagesStream = FirebaseFirestore.instance.collection('S50').snapshots();

  // Column messagesList = Column();
  void addMessage(Message message) {
    setState(() {
      messages.add(message);
    });
  }

  @override
  void initState() {
    super.initState();

    // messages.add(new Message(
    //     "a",
    //     "O 50 ta passando na José Candido AAAaaaaaaaAaaaaaaaaaaaA AAAaa | AAAA A A a AAAAAAAAAAAA a aaa",
    //     "Coquinha",
    //     DateTime.now()));
    // messages.add(new Message("b", "Peguei!", "Bruno Oliveira", DateTime.now()));
    // messages.add(
    //     new Message("c", "Perdi... ;-;", "Heitor Eduardo", DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {

    // List of messages!
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _dbMessagesStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                
                if (snapshot.data != null) {
                  List<Message> tempMessages = <Message>[];

                  for (QueryDocumentSnapshot<Object?> doc in snapshot.data!.docs) {
                    tempMessages.add(Message.fromJson(doc.data()! as Map<String, dynamic>));
                    
                  }

                  
                  messages = List.from(tempMessages.reversed);
                  messages.sort((a,b) => a.sendTime.compareTo(b.sendTime));
                }
                
                // if (snapshot.hasError) {
                  
                // }

                // if () {

                // }

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageWidget(message: messages[index]);
                  } 
                );
              },
            )
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      messageText = text;
                      if (text != "") {
                        canSendMessage = true;
                      } else {
                        canSendMessage = false;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Color.fromARGB(255, 34, 196, 169)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(color: Color.fromARGB(255, 34, 196, 169), width: 2.0),
                    ),
                    hintText: 'Mensagem',
                  ),
                ),
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: CircleBorder(), primary: Color.fromARGB(255, 34, 196, 169), padding: EdgeInsets.all(0.0)),
                onPressed: () async {
                  if(canSendMessage) {
                    // await _displayTextInputDialog(context);

                    Message messageObject = Message(
                      text: messageText, 
                      sender: FirebaseAuth.instance.currentUser!.displayName!, 
                      sendTime: DateTime.now()
                    );

                    await dbMessages
                    // .withConverter(
                    //   fromFirestore: (snapshot, _) => Message.fromJson(snapshot.data()!), 
                    //   toFirestore: (Message message, _) => message.toJson())
                    .add(messageObject.toObject()).then(
                      (value) {
                        setState(() {
                          addMessage(messageObject);
                        });
                      }
                    );
                    
                    
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(Icons.send_rounded, size: 24),
                )
              ),
            ],
          )
        ],
      ),
    );
  }







    TextEditingController _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Qual é o seu nome?'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Insira seu nome"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Cancelar'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    codeDialog = valueText;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
  late String codeDialog;
  late String valueText;
}
