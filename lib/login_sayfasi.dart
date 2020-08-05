import 'package:flutter/material.dart';
import 'package:flutter_state/user_repository.dart';
import 'package:provider/provider.dart';

class LoginEkrani extends StatefulWidget {
  @override
  _LoginEkraniState createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _email;
  TextEditingController _sifre;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = TextEditingController(text: "");
    _sifre = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _email,
                  validator: (deger) {
                    if (deger.length <= 0) {
                      return "Lütfen Email Alanını Doldurun";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Email", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _sifre,
                  validator: (deger) {
                    if (deger.length <= 0) {
                      return "Lütfen Şifre Alanını Doldurun";
                    }
                  },
                  decoration: InputDecoration(
                      labelText: "Şifre", border: OutlineInputBorder()),
                ),
              ),
              userRepo.durum == UserDurumu.OturumAciliyor
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            if (!await userRepo.signIn(
                                _email.text, _sifre.text)) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("Email/Şifre Hatalı"),
                              ));
                            }
                          }
                        },
                        color: Colors.green,
                        child: Text("Giriş Yap"),
                      ),
                    ),

            ],
          ),
        ),
      ),
    );
  }
}
