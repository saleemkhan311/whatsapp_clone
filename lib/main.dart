import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp_Replica',
      theme: ThemeData( 
        
        primaryColor: Colors.teal[800],
      ),
      home: MyHomePage(title: 'WhatsApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _controller,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: Colors.white)),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ],
          ),
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              padding: EdgeInsets.all(0.0),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildListChatTile(chats[index]);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal[800],
          onPressed: () {},
          child: Icon(Icons.message),
        ));
  }

  ListTile _buildListChatTile(Chat chat) {
    return ListTile(
      leading: chat.avatar,
      trailing: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: _buildTrailing(chat),
        //child: Text(chat.timeStamp,style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      title: Text(
        chat.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: chat.subtitle,
    );
  }

  Column _buildTrailing(Chat chat) {
    if (chat.unread > 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            chat.timeStamp,
            style: TextStyle(fontSize: 12, color: Colors.greenAccent[700]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent[700],
              ),
              width: 18,
              height: 18,
              child: Center(
                child: Text(
                  chat.unread.toString(),
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            chat.timeStamp,
            style: TextStyle(fontSize: 12),
          ),
      
        ],
      );
    }
  }
}

class Chat {
  Widget avatar;
  String title;
  Widget subtitle;
  String timeStamp;
  int unread;

  Chat(this.avatar, this.title, this.subtitle, this.timeStamp,
      {this.unread = 0});
}

List<Chat> chats = [
  Chat(
    CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.indigo,
    ),
    "James Smith",
    Row(
      children: <Widget>[
        Icon(Icons.mic, size: 16, color: Colors.grey),
        Text("0:30")
      ],
    ),
    "7:30 AM",
    unread: 3,
  ),

  Chat(
    CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.tealAccent,
    ),
    "Mark",
    Row(
      children: <Widget>[
        Icon(Icons.mic, size: 16, color: Colors.grey),
        Text("0:30")
      ],
    ),
    "12:20 PM",
    unread: 1,
  ),

   Chat(
    CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.indigo,
    ),
    'Ryan',
    Row(
      children: <Widget>[
        Icon(Icons.done_all, size: 16, color: Colors.grey),
        Text("Hello"),
      ],
    ),
    "12:24 pm",
  ),
  Chat(
    CircleAvatar(
      radius: 30.0,
      backgroundColor: Colors.red,
    ),
    "Nicolas ",
    Row(
      children: <Widget>[
        Icon(Icons.done_all, size: 16, color: Colors.grey),
        Text("flutter"),
      ],
    ),
    "1:34 PM",
  ),
  Chat(
      CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.green,
      ),
      "Taylor",
      Row(
        children: <Widget>[
          Icon(Icons.camera_alt, size: 16, color: Colors.grey),
          Text("WhatsUp"),
        ],
      ),
      "2:20 PM"
),
  Chat(
    CircleAvatar(
      backgroundColor: Colors.lightBlueAccent,
      radius: 30,
    ),
    "Mike",
    Row(
      children: <Widget>[Icon(Icons.done_all, size: 16, color: Colors.grey,), Text("Fine")],
    ),
    "FRIDAY",
  ),

  Chat(
    CircleAvatar(
      backgroundColor: Colors.brown,
      radius: 30,
    ),
    "Ahmed",
    Row(
      children: <Widget>[Icon(Icons.done_all, size: 16, color: Colors.grey,), Text("Fine")],
    ),
    "12/1/19",
  ),

Chat(
    CircleAvatar(
      backgroundColor: Colors.yellow,
      radius: 30,
    ),
    "Obayd",
    Row(
      children: <Widget>[Icon(Icons.done_all, size: 16, color: Colors.grey,), Text("Hello")],
    ),
    "11/2/19",
  ),

];
