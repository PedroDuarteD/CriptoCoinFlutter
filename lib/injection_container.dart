import 'package:cryptocoinflutter/features/data/data_sources/remote/coin_api_service.dart';
import 'package:cryptocoinflutter/features/data/repository/coin_repository_impl.dart';
import 'package:cryptocoinflutter/features/domain/repository/coin_repository.dart';
import 'package:cryptocoinflutter/features/domain/usecases/get_coin.dart';
import 'package:cryptocoinflutter/features/presentation/bloc/coin/remote/remote_coin_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
final sl = GetIt.instance;


//factory multiple instances
//singleton one instance across device
Future<void> initializeDependencies() async{

  //dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
sl.registerSingleton<CoinApiService>(sl());

sl.registerSingleton<CoinRepository>(CoinRepositoryImpl(sl()));


//use cases
sl.registerSingleton<GetCoinUseCase>(GetCoinUseCase(sl()));

//blocks
sl.registerFactory<RemoteCoinsBloc>(()=>RemoteCoinsBloc(sl()));
}