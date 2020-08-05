import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_state/bloc/sayac/sayac_bloc.dart';
import 'package:flutter_state/bloc/sayac/sayac_event.dart';

class BlocKullanimi extends StatefulWidget {
  @override
  _BlocKullanimiState createState() => _BlocKullanimiState();
}

class _BlocKullanimiState extends State<BlocKullanimi> {
  final _sayacBloc = SayacBloc();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Kullanimi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Butona Bastın"),
            StreamBuilder<int>(
              initialData: 0,
              stream: _sayacBloc.sayac,
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              _sayacBloc.sayacEventSink.add(ArtirmaEvent());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            heroTag: "2",
            onPressed: () {
              _sayacBloc.sayacEventSink.add(AzaltmaEvent());
            },
            child: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
