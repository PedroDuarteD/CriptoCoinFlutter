import 'package:cryptocoinflutter/features/domain/entities/coin.dart';

class CoinModel extends CoinEntity{
  const CoinModel({
    final int ? id,
    final String ? name,
    final String ? slug,
    final String ? symbol,
    final String ? price,
    final String ? rank,
    final String ? urlImage,
});

  factory CoinModel.fromJson(Map<String ,dynamic> map){
    return CoinModel(
      id: map["id"]??"",
      name: map["name"] ?? "",
      slug: map["slug"] ?? "",
      symbol: map["symbol"] ?? "",
      price: map["price"] ?? "",
      rank: map["rank"] ?? "",
      urlImage: map["urlImage"] ?? "",

    );
  }
}