import 'package:flutter/material.dart';

import '../constants/AppColors.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(title: const Text("Bookings")),
      body: Center(child: Text("Bookings Page Content")),
    );
  }
}
