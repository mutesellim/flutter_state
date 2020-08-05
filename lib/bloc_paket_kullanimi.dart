import 'package:flutter/material.dart';
import 'bloc_paket/sayi_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_paket/sayi_state.dart';

class BlocPaketKullanimi extends StatefulWidget {
  @override
  _BlocPaketKullanimiState createState() => _BlocPaketKullanimiState();
}

class _BlocPaketKullanimiState extends State<BlocPaketKullanimi> {
  final _mySayiBloc = SayiBloc(SayiState.initial());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SayiBloc>(
      create: (context) => _mySayiBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Bloc Paket Kullanimi"),
        ),
        body: MyCenterWidget(),
        floatingActionButton: MyFloatingActionButtons(),
      ),
    );
  }

  @override
  void dispose() {
    _mySayiBloc.close();
    super.dispose();
  }
}

class MyFloatingActionButtons extends StatelessWidget {
  const MyFloatingActionButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: "1",
          onPressed: () {
            //BlocProvider.of<SayiBloc>(context).dispatch(SayiArtirEvent());
            BlocProvider.of<SayiBloc>(context).onArttir();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          heroTag: "2",
          onPressed: () {
            //BlocProvider.of<SayiBloc>(context).dispatch(SayiAzaltEvent());
            BlocProvider.of<SayiBloc>(context).onAzalt();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new MySayiWidget(),
    );
  }
}

class MySayiWidget extends StatelessWidget {
  const MySayiWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _bloc = BlocProvider.of<SayiBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        BlocBuilder(
            cubit: _bloc,
            builder: (context, SayiState sayiState) {
              return Text(
                '${sayiState.sayi.toString()}',
                style: TextStyle(fontSize: 48),
              );
            }),
      ],
    );
  }
}
