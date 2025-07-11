import 'package:flutter/material.dart';
import 'package:full_stack_app_class_one/app/bindings/api_binding.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: ApiBinding(),
    ),
  );
}
