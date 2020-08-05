import 'package:flutter/material.dart';
import 'package:flutter_state/bloc_kullanimi.dart';
import 'package:flutter_state/bloc_paket_kullanimi.dart';
import 'package:flutter_state/firebase_provider.dart';
import 'package:flutter_state/provider_package.dart';
import 'package:flutter_state/sayac.dart';
import 'package:flutter_state/stream_kullanimi.dart';
import 'package:flutter_state/user_repository.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Sayac>(
          create: (context) => Sayac(0),
        ),
        ChangeNotifierProvider<UserRepository>(
          create: (context) => UserRepository(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProviderKullanimi()));
              },
              child: Text("Provider Kullanimi"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProviderwithFirebaseAuth()));
              },
              child: Text("Firebase Provider Kullanimi"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StreamKullanimi()));
              },
              child: Text("Stream Kullanimi"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlocKullanimi()));
              },
              child: Text("Bloc Kullanimi"),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocPaketKullanimi()));
              },
              child: Text("Bloc Paket Kullanimi"),
            ),
          ],
        ),
      ),
    );
  }
}
