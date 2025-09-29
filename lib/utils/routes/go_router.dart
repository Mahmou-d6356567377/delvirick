import 'package:delvirick/view/intro/screens/onboarding.dart';
import 'package:delvirick/view/intro/screens/users.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static const String userscreen = '/userscreen';
  static const String onboardingscreen = '/onboardingscreen';
  static const String login = '/login';
  static const String forgetpasswordscreen = '/forgetpasswordscreen';
  static const String otpscreen = '/otpscreen';
  static const String newpasswordscreen = '/newpasswordscreen';
  static const String infoscreen = '/infoscreen';
  static const String notificationscreen = '/notificationscreen';
  static const String navbarscreen = '/navbarscreen';
  static const String orderdetailscreen = '/orderdetailscreen';
  static const String mapaddressingscreen = '/mapaddressingscreen';
  static const String orderrecievingscreen = '/orderrecievingscreen';
  static const String moneywithdrowal = '/moneywithdrowal';
  static const String settingscreen = '/settingscreen';
  static const String privacypolicyscreen = '/privacypolicyscreen';
  static const String rulesscreen = '/rulesscreen';
  static const String aboutappscreen = '/aboutappscreen';
  static const String connectwithusscreen = '/connectwithusscreen';

  static final GoRouter routes = GoRouter(
    initialLocation: onboardingscreen,
    routes: [

      GoRoute(path: userscreen, builder: (context, state) => UsersScreen()),
      GoRoute(path: onboardingscreen, builder: (context, state) => OnboardingScreen()),
     
    ],
  );
}
