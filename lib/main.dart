import 'package:flutter/material.dart';

enum APP_THEME{LIGHT,DARK}

void main() {
  runApp(ContactProfilePage());
}
class MyAppTheme{
  static ThemeData appThemeLight(){
    return ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.indigo.shade800,
        )
    );
  }
  static ThemeData appThemeDark(){
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}

class ContactProfilePage extends StatefulWidget {
  @override
  State<ContactProfilePage> createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {
  var currentTheme = APP_THEME.LIGHT;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme == APP_THEME.DARK
          ? MyAppTheme.appThemeLight()
          : MyAppTheme.appThemeDark(),
      home: Scaffold(
        appBar: buildAppBarWidget(),
        body: buildBodyBarWidget(),
    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.brightness_4),
    onPressed: (){
    setState(() {
    currentTheme == APP_THEME.DARK
    ? currentTheme = APP_THEME.LIGHT
        : currentTheme = APP_THEME.DARK;
    });
    },
      ),
      ),
    );
  }
}

Widget buildCallButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.call,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      Text("Call"),
    ],
  );
}

Widget buildTextButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.textsms,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      Text("Text"),
    ],
  );
}

Widget buildVideoCallButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.video_call,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      Text("Video"),
    ],
  );
}

Widget buildEmailButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.email,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      Text("Email"),
    ],
  );
}

Widget buildDirectionsButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.directions,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      Text("Directions"),
    ],
  );
}

Widget buildPayButton() {
  return Column(
    children: <Widget>[
      IconButton(
        icon: Icon(
          Icons.attach_money,
          color: Colors.indigo.shade800,
        ),
        onPressed: () {},
      ),
      Text("Pay"),
    ],
  );
}

//ListTile
Widget mobilePhoneListTile() {
  return ListTile(
    leading: Icon(Icons.call),
    title: Text("330-803-3390"),
    subtitle: Text("mobile"),
    trailing: IconButton(
      icon: Icon(Icons.message),
      color: Colors.indigo.shade800,
      onPressed: () {},
    ),
  );
}

Widget otherPhoneListTile() {
  return ListTile(
    leading: Text(" "),
    title: Text("440-440-3390"),
    subtitle: Text("other"),
    trailing: IconButton(
      icon: Icon(Icons.message),
      color: Colors.indigo.shade800,
      onPressed: () {},
    ),
  );
}

Widget emailListTile() {
  return ListTile(
    leading: Icon(Icons.email),
    title: Text("meowmeow@ngao.com"),
    subtitle: Text("work"),
  );
}

Widget addressListTile() {
  return ListTile(
    leading: Icon(Icons.location_on),
    title: Text("234 Sunset St, USA"),
    subtitle: Text("home"),
    trailing: IconButton(
      icon: Icon(Icons.directions),
      color: Colors.indigo.shade800,
      onPressed: () {},
    ),
  );
}

AppBar buildAppBarWidget() {
  return AppBar(
    backgroundColor: Colors.pinkAccent,
    leading: Icon(
      Icons.arrow_back,
      color: Colors.black,
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {}, icon: Icon(Icons.star_border), color: Colors.black)
    ],
  );
}

Widget buildBodyBarWidget() {
  return ListView(
    children: <Widget>[
      Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            //Height constraint at Container widget level
            height: 250,
            child: Image.network(
              "https://cf.shopee.co.th/file/1245419454cb2eccecee86d7ab603662",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Meowmeow ngao",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            child: Theme(
              data: ThemeData(
                  iconTheme: IconThemeData(
                color: Colors.pink,
              )),
              child: profileActionItems(),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          mobilePhoneListTile(),
          otherPhoneListTile(),
          Divider(
            color: Colors.grey,
          ),
          emailListTile(),
          Divider(
            color: Colors.grey,
          ),
          addressListTile()
        ],
      ),
    ],
  );
}

Widget profileActionItems() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      buildCallButton(),
      buildTextButton(),
      buildVideoCallButton(),
      buildEmailButton(),
      buildDirectionsButton(),
      buildPayButton(),
    ],
  );
}
