import 'package:flutter/material.dart';

import '../constants/AppColors.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(title: const Text("Favourites")),
      body: Center(child: Text("Favourites Page Content")),
    );
  }
}
