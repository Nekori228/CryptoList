import 'package:crypto_currencies/features/crypto_list/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currencies List"),
        centerTitle: true,
      ),
      body: (_cryptoCoinsList == null)
          ? Center(child: const CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                final coinName = coin.name;
                return CryptoCoinTile(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
