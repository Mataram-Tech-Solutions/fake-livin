import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/preview/bindings/preview_binding.dart';
import '../modules/preview/views/preview_view.dart';
import '../modules/splahsScreen/bindings/splahs_screen_binding.dart';
import '../modules/splahsScreen/views/splahs_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLAHS_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PREVIEW,
      page: () => const PreviewView(),
      binding: PreviewBinding(),
    ),
    GetPage(
      name: _Paths.SPLAHS_SCREEN,
      page: () => SplashScreenView(),
      binding: SplahsScreenBinding(),
    ),
    
  ];
}
