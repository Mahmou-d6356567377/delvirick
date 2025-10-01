import 'package:delvirick/features/auth/presentation/views/login_view.dart';
import 'package:delvirick/features/auth/presentation/views/register_view.dart';
import 'package:delvirick/features/auth/presentation/views/set_location.dart';
import 'package:delvirick/features/intro/screens/map_addressing_screen.dart';
import 'package:delvirick/features/userInfo/customerInfo/presentation/views/customer_info_view.dart';
import 'package:delvirick/features/userInfo/customerInfo/presentation/widgets/congrate.dart';
import 'package:delvirick/features/userInfo/customerInfo/presentation/widgets/vertification_code_view.dart';
import 'package:delvirick/features/userInfo/driverInfo/presentation/views/driver_info_vehicle_view.dart';
import 'package:delvirick/features/userInfo/driverInfo/presentation/views/driver_info_details_view.dart';
import 'package:delvirick/features/userInfo/driverInfo/presentation/views/driver_info_image_view.dart.dart';
import 'package:delvirick/features/userInfo/driverInfo/presentation/views/driver_info_passprot_view.dart';
import 'package:delvirick/features/userInfo/driverInfo/presentation/views/driver_info_payment_view.dart';
import 'package:delvirick/features/intro/screens/onboarding.dart';
import 'package:delvirick/features/intro/screens/users.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static const String onboardingscreen = '/onboardingscreen';
  static const String userscreen = '/userscreen';
  static const String login = '/login';
  static const String register = '/register';
  static const String customerInfo = '/customerInfo';

  static const String driverInfoVehicle = '/driverInfoVehicle';
  static const String driverInfoDetails = '/driverInfoDetails';
  static const String driverInfoImage = '/driverInfoImage';
  static const String driverInfoPassprot = '/driverInfoPassprot';
  static const String driverInfoPayment = '/driverInfoPayment';

  static const String suplierInfo = '/suplierInfo';

  static const String congrate = '/congrate';

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
  static const String setlocation = '/setlocation';

  static final GoRouter route = GoRouter(
    initialLocation: onboardingscreen,
    routes: [
      GoRoute(
        path: onboardingscreen,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(path: userscreen, builder: (context, state) => UsersScreen()),
      GoRoute(path: login, builder: (context, state) => LoginView()),
      GoRoute(path: register, builder: (context, state) => RegisterView()),
      GoRoute(
        path: customerInfo,
        builder: (context, state) => CustomerInfoView(),
      ),
      GoRoute(
        path: driverInfoVehicle,
        builder: (context, state) => DriverInfoVehicleView(),
      ),
      GoRoute(
        path: driverInfoDetails,
        builder: (context, state) => DriverInfoDetailsView(),
      ),
      GoRoute(
        path: driverInfoImage,
        builder: (context, state) => DriverInfoImageView(),
      ),
      GoRoute(
        path: driverInfoPassprot,
        builder: (context, state) => DriverInfoPassprotView(),
      ),
      GoRoute(
        path: driverInfoPayment,
        builder: (context, state) => DriverInfoPaymentView(),
      ),
      GoRoute(path: congrate, builder: (context, state) => Congrate()),
      GoRoute(path: setlocation, builder: (context, state) => SetLocation()),
      GoRoute(path: mapaddressingscreen, builder: (context, state) => MapAddressingScreen(isadmin: true)),
      GoRoute(path: otpscreen, builder: (context, state) => VertificationCodeView()),
    ],
  );
}
