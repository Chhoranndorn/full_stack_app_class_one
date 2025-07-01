import 'package:flutter/material.dart';
import 'package:full_stack_app_class_one/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                // controller.getPost();
                final result = await Get.toNamed(Routes.CREATE_POST);
                if (result != null) {
                  //refresh
                  controller.getPost();
                }
              },
            )
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  controller.getPost();
                },
                child: ListView.builder(
                  itemCount: controller.post.value.data!.length,
                  itemBuilder: (context, index) {
                    final post = controller.post.value.data![index];
                    return ListTile(
                      onTap: () async {
                        //navigate to update view
                        final result =
                            await Get.toNamed(Routes.UPDATE_POST, arguments: {
                          "name": post.name,
                          "age": post.age,
                          "address": post.address,
                          "image": post.image,
                          "id": post.id,
                        });
                        if (result != null) {
                          //refresh
                          controller.getPost();
                        }
                      },
                      title: Text("${post.name}"),
                      subtitle: Text("${post.address}"),
                      leading: Image.network(post.image ?? ''),
                      trailing: IconButton(
                          onPressed: () {
                            controller.deletePost(id: post.id ?? 0);
                          },
                          icon: Icon(Icons.delete)),
                    );
                  },
                ),
              )));
  }
}
