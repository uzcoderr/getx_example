import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getx_example/service/ApiService.dart';
import 'package:getx_example/controllers/home_viewmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  HomeController controller = HomeController();

  @override
  void initState() {
    controller.apiGetUsers();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Architecture Patterns'),
      ),
      body: Center(
          child: ListView.builder(
            itemCount: controller.posts.value.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (doNothing){
                        controller.apiDeleteUsers("${ApiService.GET_API}/$index",index);
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      // An action can be bigger than the others.
                      flex: 2,
                      onPressed: (doNothing){
                        controller.nextPage(context,controller.posts.value[index], index);
                      },
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                      label: 'Update',
                    ),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.posts.value[index].title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.posts.value[index].body,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Divider(),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
