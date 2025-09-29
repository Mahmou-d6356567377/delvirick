import 'dart:async';

import 'package:delvirick/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:delvirick/auth/presentation/widgets/custom_otp_field.dart';
import 'package:flutter/material.dart';


class VertificationCodeView extends StatefulWidget {
  const VertificationCodeView({super.key});

  @override
  State<VertificationCodeView> createState() => _VertificationCodeViewState();
}

class _VertificationCodeViewState extends State<VertificationCodeView> {
  final pinController = TextEditingController();
  bool? empty;
  late Timer timer;
  int remainingSeconds = 90;
  bool isEnd = false;
  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        setState(() {
          isEnd = true;
        });
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes : $secs";
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    pinController.addListener(() {
      setState(() {
        empty = pinController.text.trim().isEmpty;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    pinController.dispose();
    super.dispose();
  }

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
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back, size: 40),
                    ),
                  ),

                  Positioned(
                    top: 128,
                    left: 25,
                    right: 0,
                    child: const Text(
                      'Enter 4-digit\nVerification Code',
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
                    child: Text(
                      'Code send to Abdullah****@gmail.com . This code will expired in ${formatTime(remainingSeconds)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff7A7A7A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OtpTextField(pinController: pinController, isError: false),

            SizedBox(height: MediaQuery.of(context).size.height * 0.33),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: CustomElevatedButton(
                backgroundColor:
                    isEnd == true ? Color(0xff10B981) : Color(0xffD1FAE5),
                onPressed: () {
                  //some logic
                  if (remainingSeconds == 0) {
                    remainingSeconds = 90;
                    isEnd = false;
                    startTimer();
                  }
                },
                child: Text(
                  'Resend code in ${formatTime(remainingSeconds)}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: CustomElevatedButton(
                backgroundColor:
                    pinController.text.isNotEmpty
                        ? Color(0xff10B981)
                        : Color(0xffD1FAE5),
                onPressed: () {
                  pinController.text.length == 4 ? print('44444444') : null;
                },
                child: Text(
                  'Next',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
