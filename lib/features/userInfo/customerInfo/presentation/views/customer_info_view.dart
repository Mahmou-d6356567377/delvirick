import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/features/widgets/custom_back_button.dart';
import 'package:delvirick/utils/routes/go_router.dart';
import 'package:delvirick/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height:  height * 0.33,
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

                    CustombackButton(),

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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    CustomButton(
                      onpress: () {
                        GoRouter.of(context).push(Routers.setlocation);
                      },
                      title: 'Next',
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
