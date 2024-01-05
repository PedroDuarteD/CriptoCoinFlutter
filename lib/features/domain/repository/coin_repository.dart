import 'package:cryptocoinflutter/features/domain/entities/coin.dart';

import '../../../core/resources/data_state.dart';

abstract class CoinRepository{
  Future<DataState<List<CoinEntity>>> getNewsCoins();
}