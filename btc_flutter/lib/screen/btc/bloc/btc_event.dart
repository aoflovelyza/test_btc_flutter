part of 'btc_bloc.dart';

abstract class BtcEvent {
  final CurrentPriceRepository _currentPriceRepository =
      CurrentPriceRepository(BaseRepository.instance);
}

class GetdataCurrencyEvent extends BtcEvent {
  Future<ApiResponse<CurrentPriceModel?>?> getCurrentPrice() async {
    var response = await _currentPriceRepository.getCurrentPrice();
    return response;
  }
}
