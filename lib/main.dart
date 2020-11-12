import 'package:Messenger/helpers/authenticate.dart';
import 'package:Messenger/helpers/constants.dart';
import 'package:Messenger/views/chats.dart';
import 'package:Messenger/views/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget
{
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  bool userIsLoggedIn;

  @override
  void initState()
  {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async
  {
    await Constants.getUserLoggedInSharedPreference().then((value)
    {
      setState(()
      {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'FlutterDevConnect',
      debugShowCheckedModeBanner: false,
      home: userIsLoggedIn != null ? userIsLoggedIn ? WebHome() : Authenticate() : Container(),
    );
  }
}