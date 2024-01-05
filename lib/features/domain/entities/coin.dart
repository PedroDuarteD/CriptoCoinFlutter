import 'package:equatable/equatable.dart';

class CoinEntity extends Equatable{
  final int ? id;
  final String ? name;
  final String ? slug;
  final String ? symbol;
  final String ? price;
  final String ? rank;
  final String ? urlImage;


  const CoinEntity({
    this.id,
    this.name,
     this.slug,
    this.symbol,
    this.price,
    this.rank,
    this.urlImage});

  @override
  List<Object?> get props => [
    id,
    name,
    slug,
    symbol,
    price,
    rank,
    urlImage
  ];

}