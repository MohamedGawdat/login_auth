enum AppState { Dev, Test, Production }

class URLS {
  final String baseUrl;
  final String lotteryImage;
  final String referralImage;
  final String partnersLogo;
  URLS({
    required this.baseUrl,
    required this.lotteryImage,
    required this.referralImage,
    required this.partnersLogo,
  });
}

class AppUrls {
  static AppState currentState = AppState.Dev;
  static late URLS baseURLS;

  static const _productionUrl = 'https://gawayez-api2.e-postserv.com:8090/api/';
  static const _testUrl = 'https://lottery-intest.itscegypt.com:4499/api/';
  static const _devUrl = 'http://172.26.2.44:7778/api/';

  static const String _ProductionImageReferralUrl =
      'https://web.gawayez.e-postserv.com/Images/WinnersCard/';
  static const String _ProductionImageLotteryUrl =
      'https://web.gawayez.e-postserv.com/Images/Prizes/';
  static const String _ProductionPartnerLogo =
      'https://web.gawayez.e-postserv.com/Images/PartnersLogo/';

  static const String _winnerReferralImageTest =
      'https://lottery-intest.itscegypt.com:6544/Images/WinnersCard/';
  static const String _winnerLotteryImageTest =
      'https://lottery-intest.itscegypt.com:6544/Images/Prizes/';
  static const String _partnerLogoTest =
      'https://lottery-intest.itscegypt.com:6544/Images/PartnersLogo/';

  static const String _winnerReferralImageDev =
      'http://172.26.2.44:7565/Images/WinnersCard/';
  static const String _winnerLotteryImageDev =
      'http://172.26.2.44:7565/Images/Prizes/';
  static const String _partnerLogoDev =
      'http://172.26.2.44:7565/Images/PartnersLogo/';
  static isTestMode() {
    return currentState == AppState.Dev || currentState == AppState.Test;
  }

  static init() {
    switch (currentState) {
      case AppState.Dev:
        {
          baseURLS = URLS(
              baseUrl: _devUrl,
              lotteryImage: _winnerLotteryImageDev,
              referralImage: _winnerReferralImageDev,
              partnersLogo: _partnerLogoDev);
          return;
          // statements;
        }

      case AppState.Test:
        {
          baseURLS = URLS(
              baseUrl: _testUrl,
              lotteryImage: _winnerLotteryImageTest,
              referralImage: _winnerReferralImageTest,
              partnersLogo: _partnerLogoTest);
          return;

          //statements;
        }
      case AppState.Production:
        {
          baseURLS = URLS(
              baseUrl: _productionUrl,
              lotteryImage: _ProductionImageLotteryUrl,
              referralImage: _ProductionImageReferralUrl,
              partnersLogo: _ProductionPartnerLogo);

          return;

          //statements;
        }

      default:
        {
          return '';
          //statements;
        }
    }
  }
}
