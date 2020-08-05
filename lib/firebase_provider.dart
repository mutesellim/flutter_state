import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_state/kullanici_sayfasi.dart';
import 'package:flutter_state/login_sayfasi.dart';
import 'package:flutter_state/user_repository.dart';
import 'package:provider/provider.dart';

class ProviderwithFirebaseAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepo, child) {
        switch (userRepo.durum) {
          case UserDurumu.Idle:
            return SplashEkran();
          case UserDurumu.OturumAciliyor:
          case UserDurumu.OturumAcilmamis:
            return LoginEkrani();
          case UserDurumu.OturumAcik:
            return KullaniciEkrani();
        }
      },
    );
  }
}

class SplashEkran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Ekran"),
      ),
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
