import 'package:cryptocoinflutter/core/constants/constants.dart';
import 'package:cryptocoinflutter/features/data/models/Coin.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part "coin_api_service.g.dart";

@RestApi(baseUrl: coinAPIBaseURL)
abstract class CoinApiService{
  factory CoinApiService(Dio dio) = _CoinApiService;

  @GET("/cryptocurrency/listings/latest")
  Future<HttpResponse<List<CoinModel>>> getNewsCoins({
  @Query("start") String ? start,
  @Query("limit") String ? limit,
  @Query("convert") String ? convert,
  @Query("CMC_PRO_API_KEY") String ? CMC_PRO_API_KEY,
});
}