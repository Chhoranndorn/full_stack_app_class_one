import 'package:full_stack_app_class_one/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class ApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiProvider(), permanent: true);
  }
}
