import 'package:cryptocoinflutter/core/resources/data_state.dart';
import 'package:cryptocoinflutter/features/presentation/bloc/coin/remote/remote_coin_event.dart';
import 'package:cryptocoinflutter/features/presentation/bloc/coin/remote/remote_coin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/get_coin.dart';

class RemoteCoinsBloc extends Bloc<RemoteCoinEvent, RemoteCoinState>{

  final GetCoinUseCase _getCoinUseCase;

  RemoteCoinsBloc(this._getCoinUseCase):super(const RemoteCoinLoading()){
    on <GetCoins> (onGetCoins);
  }

  void onGetCoins(GetCoins event,Emitter<RemoteCoinState> emit)async{
  final dataState = await _getCoinUseCase();

  if(dataState is DataSuccess &&  dataState.data!.isNotEmpty){
    emit(
      RemoteCoinDone(dataState.data!)
    );
  }

  if(dataState is DataFailed){
    emit(RemoteCoinError(dataState.error!));
  }
  }
}