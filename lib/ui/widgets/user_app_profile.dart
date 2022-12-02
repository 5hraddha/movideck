import 'package:flutter/material.dart';

class UserAppProfile extends StatelessWidget {
  const UserAppProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      child: const CircleAvatar(
        backgroundColor: Colors.white,
        radius: 23.0,
        child: CircleAvatar(
          backgroundColor: Color(0xFF191919),
          radius: 21.0,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/girl-profile-image.png'),
            radius: 20.0,
          ),
        ),
      ),
    );
  }
}
