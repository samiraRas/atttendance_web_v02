import 'package:flutter/material.dart';

class poiUser extends StatefulWidget {
  const poiUser({Key? key}) : super(key: key);

  @override
  State<poiUser> createState() => _poiUserState();
}

class _poiUserState extends State<poiUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("Loading")],
      )),
    );
  }
}
