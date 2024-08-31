import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileImage extends StatelessWidget {
  final String nameInfo;

  EditProfileImage({required this.nameInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile Image'),
      ),
      body: Center(
        child: Text('Edit Profile Image for $nameInfo'),
      ),
    );
  }
}
