import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:school_app/constants/auth_api.dart';

import '../model/userIndex.dart';
import '../utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Posts responseModel;

  int userIndexLength = 0;

  bool isLoading = true;

  List userData = [];

  @override
  void initState() {
    userIndexFunction();
    super.initState();
  }

  void userIndexFunction() async {
    print("Start");
    var response = await GetApiCall('$baseUrl$userIndex', context);
    print(response);
    final Map<String, dynamic> responseData = jsonDecode(response!);
    Posts responseModel = Posts.fromJson(responseData);
    setState(() {
      isLoading = false;
      userIndexLength = responseModel.posts.length;
      userData = responseModel.posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE9DDC1),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'SCHOOL NAME',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            Container(
              width: 39,
              height: 38,
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(50)),
              child: const Center(
                child: Text(
                  'LOGO',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     SizedBox(
                      //       width: MediaQuery.sizeOf(context).width - 64,
                      //       child: const Center(
                      //         child: Text(
                      //           "Standard",
                      //           style: TextStyle(fontSize: 32),
                      //         ),
                      //       ),
                      //     ),
                      //     InkWell(
                      //       onTap: () async {
                      //         var url = '$baseUrl$auth';
                      //       },
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //             color: Colors.black,
                      //             borderRadius: BorderRadius.circular(10)),
                      //         child: const Icon(
                      //           Icons.add,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        // height: double.infinity,
                        height: MediaQuery.sizeOf(context).height/1.21,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: userIndexLength,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(Icons.person),
                                  ),
                                  // const SizedBox(width: 50,),
                                  Spacer(),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width / 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          userData[index].name,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text('${userData[index].roleid} (${userData[index].rolename})',
                                            style: TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
