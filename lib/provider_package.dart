import 'package:flutter/material.dart';
import 'package:flutter_state/sayac.dart';
import 'package:provider/provider.dart';

class ProviderKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1.Yöntem
    final mySayac = Provider.of<Sayac>(context);
    //2.Yöntem
    return Consumer(
      builder: (context, Sayac mySayac2, widget) => Scaffold(
        appBar: AppBar(
          title: Text("Provider Kullanimi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Butona Bastın"),
              Text(
                "${mySayac2.sayac}",
              )
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
                mySayac.artir();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              heroTag: "2",
              onPressed: () {
                mySayac.azalt();
              },
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
