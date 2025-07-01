import 'package:full_stack_app_class_one/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class UpdatePostController extends GetxController {
  final _provider = Get.find<ApiProvider>();

  void updatePost(
      {required String name,
      required String age,
      required String address,
      required String image,
      required int id}) async {
    final isSuccess = await _provider.createPost(
        name: name, age: age, address: address, image: image);
    if (isSuccess) {
      print("success");
      Get.back(result: true);
    } else {
      print("false");
      Get.snackbar("Error", "Failed to create post");
    }
  }
}
