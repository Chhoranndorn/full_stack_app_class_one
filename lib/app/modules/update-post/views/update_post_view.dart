import 'package:flutter/material.dart';
import 'package:full_stack_app_class_one/app/modules/update-post/controllers/update_post_controller.dart';

import 'package:get/get.dart';

class UpdatePostView extends GetView<UpdatePostController> {
  UpdatePostView({super.key});
  final __formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _imageController = TextEditingController();
  var id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UpdatePostView'),
          centerTitle: true,
        ),
        body: GetBuilder<UpdatePostController>(initState: (state) {
          final post = Get.arguments;
          _nameController.text = post['name'] ?? '';
          _ageController.text = post['age'] ?? '';
          _addressController.text = post['address'] ?? '';
          _imageController.text = post['image'] ?? '';
          id = post['id'];
        }, builder: (logic) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: __formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      label: Text("Title"),
                    ),
                  ),
                  TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      label: Text("Age"),
                    ),
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      label: Text("Address"),
                    ),
                  ),
                  TextFormField(
                    controller: _imageController,
                    decoration: InputDecoration(
                      label: Text("Image"),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                final name = _nameController.text;
                                final age = _ageController.text;
                                final address = _addressController.text;
                                final image = _imageController.text;
                                print("name: $name");
                                print("address: $address");
                                print("image: $image");
                                // return;
                                controller.updatePost(
                                    id: id,
                                    name: name,
                                    age: age,
                                    address: address,
                                    image: image);
                              },
                              child: Text('Save')))
                    ],
                  )
                ],
              ),
            ),
          );
        }));
  }
}
