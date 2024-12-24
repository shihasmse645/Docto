import 'package:get/get.dart';
import 'package:ghotest/Views/Navbar.dart';
import 'package:ghotest/Views/login.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  RxBool isLoggedIn = false.obs;
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLogged') ?? false;
    await getUsername();
    await Future.delayed(const Duration(seconds: 2));
    navigateToInitialRout();
  }

  Future<void> navigateToInitialRout() async {
    if (isLoggedIn.value) {
      Get.off(() => const NavBar());
    } else {
      Get.off(() => const LoginPage());
    }
    return;
  }

  Future<void> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email') ?? '';
    if (email.isNotEmpty) {
      String extractedUsername = email.split('@')[0];
      username.value = _capitalizeFirstLetter(extractedUsername);
    }
  }

  String _capitalizeFirstLetter(String text) {
    final format = NumberFormat.simpleCurrency(locale: 'en');
    return text.isEmpty ? text : text[0].toUpperCase() + text.substring(1);
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in both fields.");
      return;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Please enter a valid email.");
      return;
    }
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('isLogged', true);

    isLoading(false);
    await getUsername();

    Get.off(() => const NavBar());
  }

  Future<void> signUp(String email, String password, String phNumber,
      String countryCode) async {
    String fullMobileNumber = countryCode + phNumber;
    if (email.isEmpty || password.isEmpty || phNumber.isEmpty) {
      Get.snackbar("Error", "Please fill all fields.");
      return;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Please enter a valid email.");
      return;
    }
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('mobileNumber', fullMobileNumber);
    await prefs.setString('password', password);
    await prefs.setBool('isLogged', true);

    await getUsername();
    isLoading(false);
    Get.off(() => const NavBar());
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    prefs.setBool('isLogged', false);
    isLoggedIn.value = false;
    Get.off(() => const LoginPage());
  }
}
