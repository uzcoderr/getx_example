import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_example/service/ApiService.dart';

import '../model/Post.dart';

class UpdateController extends GetxController{

  Rx<TextEditingController> body = TextEditingController().obs;
  Rx<TextEditingController> title = TextEditingController().obs;

  void apiUpdateUsers(String api,Post post,context,widget) {
    ApiService.UPDATE(api, ApiService.paramsPost(post))
        .then((value) => {
      Get.back(result: widget.post,)
    });
  }


}