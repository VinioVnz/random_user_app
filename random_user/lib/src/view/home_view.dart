import 'package:flutter/material.dart';
import 'package:random_user/src/widgets/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Home',
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: Center(child: Text('home')),
    );
  }
}
