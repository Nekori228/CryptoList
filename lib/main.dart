import 'package:crypto_currencies/crypto_coins_list_app.dart';
import 'package:crypto_currencies/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(dio: Dio()),
  );

  runApp(const CryptoCurrenciesListApp());
}
