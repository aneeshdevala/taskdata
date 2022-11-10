import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userdata/homescreen/controller/homecontroller.dart';
import 'package:userdata/homescreen/model/model.dart';
import 'package:userdata/homescreen/view/edit_screen.dart';
import 'package:userdata/homescreen/view/widgets/textformfield.dart';
import 'package:userdata/homescreen/service/service.dart';
import 'package:userdata/utils/size.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeController>();
    print(provider.readOnly);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: FutureBuilder<UserModel?>(
            future: provider.getUserProfile(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: MemoryImage(const Base64Decoder()
                              .convert(snapshot.data!.imageBinary)),
                        ),
                        kheight20,
                        TextFieldWidgetHome(
                          readOnly: false,
                          icon: Icons.person,
                          size: size,
                          contoller: provider.userNameController,
                          hint: 'User Name',
                          type: TextInputType.name,
                        ),
                        kheight20,
                        TextFieldWidgetHome(
                          readOnly: provider.readOnly,
                          icon: Icons.email,
                          size: size,
                          contoller: provider.emailController,
                          hint: 'Email',
                          type: TextInputType.name,
                        ),
                        kheight20,
                        TextFieldWidgetHome(
                          readOnly: provider.readOnly,
                          icon: Icons.home,
                          size: size,
                          contoller: provider.addressController,
                          hint: 'Email',
                          type: TextInputType.name,
                        ),
                        kheight20,
                        TextFieldWidgetHome(
                          readOnly: provider.readOnly,
                          icon: Icons.phone,
                          size: size,
                          contoller: provider.mobNoController,
                          hint: 'Mobile Number',
                          type: TextInputType.number,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EditScreen()));

                                    // showModalBottomSheet(
                                    //     shape: const RoundedRectangleBorder(
                                    //         borderRadius: BorderRadius.vertical(
                                    //       top: Radius.circular(40),
                                    //     )),
                                    //     context: context,
                                    //     isScrollControlled: true,
                                    //     builder: (context) {
                                    //       return BottomSheetSettings(

                                    //       );
                                    //     });
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.purple,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Edit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () =>
                                      ProfileService().getUserProfile(),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.purple,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Logout',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        // TextField(
                        //   decoration: InputDecoration(
                        //     hintText: 'Enter your name',
                        //     labelText: 'Name',
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),
                        // kheight20,
                        // TextField(
                        //   decoration: InputDecoration(
                        //     hintText: 'Enter your Email',
                        //     labelText: 'Email',
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),
                        // kheight20,
                        // TextField(
                        //   decoration: InputDecoration(
                        //     hintText: 'Enter your Mobile number',
                        //     labelText: 'Phone',
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
