import 'package:full_stack_app_class_one/app/data/models/post_model.dart';
import 'package:full_stack_app_class_one/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _provider = Get.find<ApiProvider>();
  var isLoading = false.obs;
  Rx<PostResponse> post = Rx(PostResponse());

  @override
  void onInit() {
    getPost();
    super.onInit();
  }

  void getPost() async {
    isLoading(true);
    final responsePost = await _provider.fetchPost();
    if (responsePost == null) return;
    post.value = responsePost;
    isLoading(false);
  }

  void deletePost({required int id}) async {
    final isSuccess = await _provider.deletePost(id: id);
    if (isSuccess) {
      print("success");
      // Get.back(result: true);
      getPost();
    } else {
      print("false");
      Get.snackbar("Error", "Failed to create post");
    }
  }
}
