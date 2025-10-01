import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class DriverInfoPaymentView extends StatefulWidget {
  const DriverInfoPaymentView({super.key});

  @override
  State<DriverInfoPaymentView> createState() => _DriverInfoPaymentViewState();
}

class _DriverInfoPaymentViewState extends State<DriverInfoPaymentView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController bankController = TextEditingController();
  TextEditingController routController = TextEditingController();
  TextEditingController accNumController = TextEditingController();
  TextEditingController confirmAccNumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.28,
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
                        'Add payment method',
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
                        '''We'll deposit your earnings directly to this account''',
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
                    CustomTextField(
                      controller: bankController,
                      hintText: 'Bank Name',
                    ),
                    CustomTextField(
                      controller: routController,
                      hintText: 'Routing Number',
                    ),
                    CustomTextField(
                      controller: accNumController,
                      hintText: 'Account Number',
                    ),
                    CustomTextField(
                      controller: confirmAccNumController,
                      hintText: 'Confirm Account Number',
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 18,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Color(0xffDD7E3E)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 5,
                              children: [
                                Image.asset(
                                  'assets/images/secure.png',
                                  width: 20,
                                  height: 20,
                                ),
                                Text(
                                  'Your information is secure',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xffAB5E29),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text(
                                'We use bank-level encryption to protect your financial\ndata. Your information is never stored in plain text.',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Color(0xffAB5E29),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045,
                    ),
                    CustomElevatedButton(
                      backgroundColor: Color(0xff10B981),
                      onPressed: () {
                        GoRouter.of(context).push(Routers.congrate);
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
            ],
          ),
        ),
      ),
    );
  }
}
