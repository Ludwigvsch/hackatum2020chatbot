import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackatum2020chatbot/facts_message.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

// main() {
//   var rng = new Random();
//   for (var i = 0; i < 10; i++) {
//     print(rng.nextInt(100));
//   }
// }

Map<String, dynamic> data;
String textmessage;

int randomNumber;
class FlutterFactsChatBot extends StatefulWidget {
  FlutterFactsChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterFactsChatBotState createState() => new _FlutterFactsChatBotState();
}

class _FlutterFactsChatBotState extends State<FlutterFactsChatBot> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Random random = new Random();
    randomNumber = random.nextInt(100000);
    print(randomNumber);
  }
  
  final List<Facts> messageList = <Facts>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _queryInputWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left:8.0, right: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send, color: Colors.green[400],),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
    http.Client _getClient(){
    return http.Client();
  }
  void agentResponse(query) async {
    
    _textController.clear();
    try{
      var client = _getClient();
      await client.post('https://civa-app.herokuapp.com/query?sessionId=$randomNumber', body: {'query': query}).then((response){data = jsonDecode(response.body); textmessage = data['response'];});
     
      Facts message = Facts(
        
        text: textmessage,
        name: "Flutter",
        type: false 
      );
      
      
   
    setState(() {
      messageList.insert(0, message);
    });
    } catch (e) {
      print(e);
      Alert(
      context: context,
      type: AlertType.error,
      style: AlertStyle(
          titleStyle: TextStyle(
            color: Colors.white,
          ),
          descStyle: TextStyle(color: Colors.white)),
      title: "Error",
      desc: "The Bot is unavailable right now, please try later",
      buttons: [
        DialogButton(
          color: Colors.blue,
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    }
  }

  void _submitQuery(String text) {
    _textController.clear();
    Facts message = new Facts(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chat", style: TextStyle(color: Colors.white),),
        // backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => messageList[index],
              itemCount: messageList.length,
            )),
        _queryInputWidget(context),
      ]),
    );
  }
}