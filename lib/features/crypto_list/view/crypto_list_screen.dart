import 'package:crypto_currencies/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_currencies/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _cryptoListBloc = CryptoListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currencies List"),
        centerTitle: true,
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = state.coinsList[i];
                return CryptoCoinTile(coin: coin);
              },
            );
          }
          if (state is CryptoListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Something went wrong'),
                  Text('Please try again later')
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),

      // ? Center(child: const CircularProgressIndicator())
      // : ListView.separated(
      //     padding: EdgeInsets.only(top: 16),
      //     itemCount: _cryptoCoinsList!.length,
      //     separatorBuilder: (context, index) => const Divider(),
      //     itemBuilder: (context, i) {
      //       final coin = _cryptoCoinsList![i];
      //       return CryptoCoinTile(coin: coin);
      //     },
      //   ),
    );
  }
}
