import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_post_controller.dart';

class CreatePostView extends GetView<CreatePostController> {
  CreatePostView({super.key});
  final __formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CreatePostView'),
          centerTitle: true,
        ),
        body: Padding(
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
                              controller.createPost(
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
        ));
  }
}
