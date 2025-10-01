import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriverInfoDetailsView extends StatefulWidget {
  const DriverInfoDetailsView({super.key});

  @override
  State<DriverInfoDetailsView> createState() => _DriverInfoDetailsViewState();
}

class _DriverInfoDetailsViewState extends State<DriverInfoDetailsView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fNController = TextEditingController();
  TextEditingController lNController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
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
                      'Tell us about yourself',
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
                      'We need your basic information to create your driver profile',
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
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 30,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / 2 -
                              MediaQuery.of(context).size.width / 10,
                          child: CustomTextField(
                            controller: fNController,
                            hintText: 'First Name',
                          ),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width / 2 -
                              MediaQuery.of(context).size.width / 10,
                          child: CustomTextField(
                            controller: lNController,
                            hintText: 'Last Name',
                          ),
                        ),
                      ],
                    ),
                    CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone Number',
                    ),
                    CustomTextField(
                      controller: cityController,
                      hintText: 'City',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    CustomElevatedButton(
                      backgroundColor: Color(0xff10B981),
                      onPressed: () {
                        GoRouter.of(context).push(Routers.driverInfoImage);
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
