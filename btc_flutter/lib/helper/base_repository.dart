class BaseRepository {
  BaseRepository._privateConstructor();
  static final BaseRepository instance = BaseRepository._privateConstructor();

  String baseUrl = "https://api.coindesk.com/v1/";

  var currentPrice = "bpi/currentprice.json";
}
