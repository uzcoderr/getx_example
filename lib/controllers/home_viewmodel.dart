import 'package:flutter/material.dart';
import 'package:getx_example/controllers/app_route.dart';
import 'package:getx_example/model/Post.dart';
import 'package:getx_example/screens/edit_post_screen.dart';
import 'package:getx_example/screens/home_page.dart';
import 'package:getx_example/service/ApiService.dart';
import 'package:get/get.dart';

class HomeController extends GetxController  {

  Rx<List<Post>> posts = Rx<List<Post>>([]);

  List<GetPage> getPagesList(){
    return [
      GetPage(
          name: AppRoute.home,
          page: () => const MyHomePage()
      ),
    ];
  }

  void apiGetUsers() {
    ApiService.GET(ApiService.GET_API, ApiService.paramsEmpty())
        .then((value) => {
          posts.value = value!,
    });
  }

  void apiDeleteUsers(String api,index) {
    ApiService.DELETE(api, ApiService.paramsEmpty())
        .then((value) => {
      posts.value.removeAt(index)
    });
  }

  void nextPage(BuildContext context,Post post,int index) async{

    final result = await Get.to(
      MaterialPageRoute(builder: (context) => PostUpdateScreen(post: post, index: index)),
    );

    posts.value[index] = result;
  }


}