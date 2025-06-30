import 'package:flutter/material.dart';

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
        ),
        body: Obx(() => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.post.value.data!.length,
                itemBuilder: (context, index) {
                  final post = controller.post.value.data![index];
                  return ListTile(
                    title: Text("${post.name}"),
                    subtitle: Text("${post.address}"),
                    leading: Image.network(post.image ?? ''),
                  );
                },
              )));
  }
}
