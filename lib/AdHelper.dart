// ignore_for_file: file_names

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-2610940733433953/5202683961',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  static BannerAd myBanner2 = BannerAd(
    adUnitId: 'ca-app-pub-2610940733433953/5202683961',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
}
