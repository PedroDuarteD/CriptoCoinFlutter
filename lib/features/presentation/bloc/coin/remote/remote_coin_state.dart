import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../domain/entities/coin.dart';

abstract class RemoteCoinState extends Equatable{
  final List<CoinEntity> ? coins;
  final DioException? error;

  const RemoteCoinState({this.coins, this.error});

  @override
  List<Object> get props => [coins!, error!];
}


class RemoteCoinLoading extends RemoteCoinState{
  const RemoteCoinLoading();
}

class RemoteCoinDone extends RemoteCoinState{
  const RemoteCoinDone(List<CoinEntity> coins) : super(coins: coins);
}

class RemoteCoinError extends RemoteCoinState{
  const RemoteCoinError(DioException exception) : super(error: exception);
}