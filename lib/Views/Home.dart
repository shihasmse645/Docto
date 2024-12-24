import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ghotest/constants/AppColors.dart';
import 'package:ghotest/constants/DoctorList.dart';
import 'package:ghotest/widgets/Appointmentcard.dart';
import 'package:ghotest/widgets/CategoryWidget.dart';
import 'package:ghotest/widgets/DoctorCard.dart';
import 'package:ghotest/widgets/customRow.dart';
import 'package:ghotest/widgets/offerCard.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/AuthController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 28.0, left: 13, right: 13, bottom: 10),
            child: Column(
              children: [
                // First child: ListTile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, ${loginController.username}',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'How Are You Today?',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      labelText: "Search for 'Doctor'",
                      labelStyle: GoogleFonts.poppins(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Our Services',
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: AppointmentCard(
                        icon: FontAwesomeIcons.clinicMedical,
                        label: 'Clinic Appointment',
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: AppointmentCard(
                        icon: FontAwesomeIcons.internetExplorer,
                        label: 'Online Appointment',
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),
                const CustomRow(
                  title: "Offers",
                ),

                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      OfferCard(
                        title: "Hello Doctors",
                        description:
                            "Offer 50% off for your first video call with your doctor",
                        imagePath: 'assets/images/offerbg.png',
                      ),
                      OfferCard(
                        title: "Exclusive Health Package",
                        description: "Get a full health check-up with 30% off",
                        imagePath: 'assets/images/offerbg.png',
                      ),
                      OfferCard(
                        title: "Summer Fitness Sale",
                        description: "Enjoy 40% off on all fitness equipment",
                        imagePath: 'assets/images/offerbg.png',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomRow(
                  title: "Categories",
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryCard(
                      name: 'Cardiology',
                    ),
                    CategoryCard(
                      name: 'Neurology',
                    ),
                    CategoryCard(
                      name: 'Dermatology',
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryCard(name: 'Pulmanology'),
                    CategoryCard(
                      name: 'Surgery',
                    ),
                    CategoryCard(name: 'Nephrology'),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomRow(title: "Top Doctors"),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 400, // Limit the height of the list
                  child: ListView.builder(
                    itemCount: doctors.length, // Use doctors.length
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return DoctorCard(
                        doctorImage: doctor.doctorImage,
                        name: doctor.name,
                        department: doctor.department,
                        location: doctor.location,
                        rating: doctor.rating,
                        reviewsCount: doctor.reviewsCount,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
