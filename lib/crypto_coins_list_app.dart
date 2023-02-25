import 'package:crypto_currencies/router/router.dart';
import 'package:crypto_currencies/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenciesList',
      theme: darkTheme,
      routes: routes,
    );
  }
}