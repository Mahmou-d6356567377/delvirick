import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriverInfoVehicleView extends StatefulWidget {
  const DriverInfoVehicleView({super.key});

  @override
  State<DriverInfoVehicleView> createState() => _DriverInfoVehicleViewState();
}

class _DriverInfoVehicleViewState extends State<DriverInfoVehicleView> {
  TextEditingController fNController = TextEditingController();
  TextEditingController lNController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  PageController controller = PageController();
  List<String> types = ['Bicycle', 'Car', 'MotorCycle', 'Scooter', 'Truck'];
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/image3.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 65,
                    left: 25,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 14,
                        ),
                        minimumSize: const Size(48, 48),
                        backgroundColor: const Color(0xffF7F5ED),
                        foregroundColor: const Color(0xffA97B3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back, size: 40),
                    ),
                  ),

                  Positioned(
                    top: 128,
                    left: 25,
                    right: 0,
                    child: const Text(
                      'What is Your Vehicle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 185,
                    left: 25,
                    right: 0,
                    child: const Text(
                      '''Choose the vehicle you'll use for deliveries to get matched with appropriate orders''',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff7A7A7A),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                spacing: 30,
                children: [
                  Text(
                    types[curIndex],
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),

                  SizedBox(
                    height: 200,
                    child: PageView(
                      onPageChanged:
                          (value) => setState(() {
                            curIndex = value;
                          }),
                      padEnds: false,
                      controller: controller,
                      children: List.generate(
                        5,
                        (index) => Image.asset(
                          'assets/images/c${index + 1}.png',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: curIndex == index ? 7 : 6,
                        width: curIndex == index ? 20 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              curIndex == index
                                  ? Color(0xff10B981)
                                  : Color(0xff7A7A7A),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '← Swipe to Choose →',
                    style: TextStyle(color: Color(0xff7A7A7A), fontSize: 16),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  CustomElevatedButton(
                    backgroundColor: Color(0xff10B981),
                    onPressed: () {
                      GoRouter.of(context).push(Routers.driverInfoDetails);
                    },
                    child: Text(
                      'Choose This',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
