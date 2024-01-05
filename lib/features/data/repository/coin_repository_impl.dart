import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cryptocoinflutter/core/constants/constants.dart';
import 'package:cryptocoinflutter/core/resources/data_state.dart';
import 'package:cryptocoinflutter/features/data/data_sources/remote/coin_api_service.dart';
import 'package:cryptocoinflutter/features/data/models/Coin.dart';
import 'package:cryptocoinflutter/features/domain/repository/coin_repository.dart';

class CoinRepositoryImpl implements CoinRepository{

  final CoinApiService _coinApiService;
  CoinRepositoryImpl(this._coinApiService);
  @override
  Future<DataState<List<CoinModel>>> getNewsCoins() async{

    try{


    final httpResponse = await _coinApiService.getNewsCoins(
      start: start,
      limit: limit,
      convert: convert,
      CMC_PRO_API_KEY: CMC_PRO_API_KEY
    );

    if(httpResponse.response.statusCode==HttpStatus.ok){
      return DataSuccess(httpResponse.data);
    }else{
      return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions
        )
      );
    }

    }on DioException catch (e){
      return DataFailed(e);
    }

  }

}