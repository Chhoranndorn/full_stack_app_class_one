import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:full_stack_app_class_one/app/data/models/post_model.dart';
import "package:get/get.dart";

class ApiProvider {
  final dio = Dio(BaseOptions(
      baseUrl: "http://10.0.2.2:8000/api",
      // baseUrl: "http://192.168.162.82:8000/api",
      contentType: "application/json",
      validateStatus: (status) {
        return status! < 500;
      }));
  Future<PostResponse?> fetchPost() async {
    try {
      final response = await dio.get("/posts");
      if (response.statusCode == 200) {
        final data = response.data;
        return PostResponse.fromJson(data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: e.message ?? "An error occurred",
      );
    }
    return null;
  }

  Future<bool> createPost(
      {required String name,
      required String age,
      required String address,
      required String image}) async {
    try {
      final response = await dio.post('/posts', data: {
        "name": name,
        "age": age,
        "address": address,
        "image": image,
      });
      if (response.statusCode == 201) {
        //created success
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updatePost(
      {required String name,
      required String age,
      required String address,
      required String image,
      required int id}) async {
    try {
      final response = await dio.put('/posts/$id', data: {
        "name": name,
        "age": age,
        "address": address,
        "image": image,
      });
      if (response.statusCode == 200) {
        //created success
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> deletePost({required int id}) async {
    try {
      final response = await dio.delete('/posts/$id');
      if (response.statusCode == 200) {
        //created success
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
