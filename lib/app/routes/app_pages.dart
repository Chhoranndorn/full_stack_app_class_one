import 'package:get/get.dart';

import '../modules/create-post/bindings/create_post_binding.dart';
import '../modules/create-post/views/create_post_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/update-post/bindings/update_post_binding.dart';
import '../modules/update-post/views/update_post_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_POST,
      page: () => CreatePostView(),
      binding: CreatePostBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_POST,
      page: () => UpdatePostView(),
      binding: UpdatePostBinding(),
    ),
  ];
}
