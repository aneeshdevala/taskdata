import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userdata/homescreen/controller/homecontroller.dart';
import 'package:userdata/homescreen/controller/imageprovider.dart';
import 'package:userdata/homescreen/view/homescreen.dart';
import 'package:userdata/homescreen/view/widgets/textformfield.dart';
import 'package:userdata/utils/size.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<UserImagePovHome>(
                builder: (context, value, child) => GestureDetector(
                    onTap: () => value.pickImage(context),
                    child: Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(const Base64Decoder()
                                .convert(provider.imageBinary!)),
                          ),
                          const Positioned(
                            bottom: 20,
                            right: 20,
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )),
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
                readOnly: false,
                icon: Icons.email,
                size: size,
                contoller: provider.emailController,
                hint: 'Email',
                type: TextInputType.name,
              ),
              kheight20,
              TextFieldWidgetHome(
                readOnly: false,
                icon: Icons.home,
                size: size,
                contoller: provider.addressController,
                hint: 'Email',
                type: TextInputType.name,
              ),
              kheight20,
              TextFieldWidgetHome(
                readOnly: false,
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
                          provider.updateProfile(context: context);
                          Navigator.of(context).pop(MaterialPageRoute(
                              builder: (ctx) => const HomeScreen()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purple,
                          ),
                          child: const Center(
                            child: Text(
                              'Update',
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
            ],
          ),
        ),
      )),
    );
  }
}
