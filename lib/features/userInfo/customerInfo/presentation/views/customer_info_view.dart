import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomerInfoView extends StatefulWidget {
  const CustomerInfoView({super.key});

  @override
  State<CustomerInfoView> createState() => _CustomerInfoViewState();
}

class _CustomerInfoViewState extends State<CustomerInfoView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fNController = TextEditingController();
  TextEditingController lNController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back, size: 40),
                      ),
                    ),

                    Positioned(
                      top: 128,
                      left: 25,
                      right: 0,
                      child: const Text(
                        'Fill in your Details\nto get started',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 230,
                      left: 25,
                      right: 0,
                      child: const Text(
                        'This details will be displayed in your account profile',
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
                      controller: fNController,
                      hintText: 'First Name',
                    ),
                    CustomTextField(
                      controller: lNController,
                      hintText: 'Last Name',
                    ),
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Phone Number',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    CustomElevatedButton(
                      backgroundColor: Color(0xff10B981),
                      onPressed: () {
                        //Navigate to Location
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
