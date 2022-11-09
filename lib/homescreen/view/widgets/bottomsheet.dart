import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userdata/homescreen/controller/homecontroller.dart';
import 'package:userdata/homescreen/controller/imageprovider.dart';
import 'package:userdata/utils/size.dart';

class BottomSheetSettings extends StatelessWidget {

  const BottomSheetSettings({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pov = context.read<HomeController>();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Consumer<UserImagePovHome>(builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  value.pickImage();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  //  backgroundImage: MemoryImage(const Base64Decoder().convert(value.imageToString.trim().isEmpty ? image : value.imageToString)),
                ),
              );
            }),
            kheight,
            TextFieldWidgetHomeBottom(
              icon: Icons.email_outlined,
              size: size,
              contoller: pov.userNameController,
              hint: 'User Name',
              type: TextInputType.name,
            ),
            kheight,
            TextFieldWidgetHomeBottom(
              icon: Icons.email_outlined,
              size: size,
              contoller: pov.emailController,
              hint: 'Email',
              type: TextInputType.emailAddress,
            ),
            kheight,
            TextFieldWidgetHomeBottom(
              icon: Icons.email_outlined,
              size: size,
              contoller: pov.mobNoController,
              hint:   'Mobile Number',
              type: TextInputType.number,
            ),
            kheight,
            TextFieldWidgetHomeBottom(
              icon: Icons.email_outlined,
              size: size,
              contoller: pov.addressController,
              hint:   'Address',
              type: TextInputType.name,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .84,
              child: ElevatedButton(
                onPressed: () {
                  pov.updateProfile(
                    context: context
                  );
                  Navigator.pop(context);
                  //   pov.changeNameController.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'redhat',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidgetHomeBottom extends StatelessWidget {
  final TextInputType type;
  final String hint;
  final TextEditingController contoller;
  final Size size;
  final IconData icon;
  const TextFieldWidgetHomeBottom({
    Key? key,
    required this.icon,
    required this.size,
    required this.contoller,
    required this.hint,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          controller: contoller,
          keyboardType: type,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: .8,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            ),
            hintText: hint,
            hintStyle: const TextStyle(
              letterSpacing: 1,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
