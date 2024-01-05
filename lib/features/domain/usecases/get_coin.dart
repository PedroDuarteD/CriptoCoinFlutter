import 'package:cryptocoinflutter/core/resources/data_state.dart';
import 'package:cryptocoinflutter/core/usecases/usecase.dart';
import 'package:cryptocoinflutter/features/domain/entities/coin.dart';
import 'package:cryptocoinflutter/features/domain/repository/coin_repository.dart';

class GetCoinUseCase implements UseCase<DataState<List<CoinEntity>>, void>{

  final CoinRepository _coinRepository;

  GetCoinUseCase(this._coinRepository);
  @override
  Future<DataState<List<CoinEntity>>> call({void params}) {
    return _coinRepository.getNewsCoins();
  }
  
}