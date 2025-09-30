import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/features/widgets/top_app_background.dart';
import 'package:delvirick/utils/routes/go_router.dart';
import 'package:delvirick/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isVisible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool visible = false;
  List<String> authMethodsIcon = ['google', 'facebook', 'apple'];
  bool? empty;
  @override
  void initState() {
    emailController.addListener(() {
      setState(() {
        empty = emailController.text.trim().isEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBackground(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                key: formKey,
                child: Column(
                  // spacing: 20,
                  children: [
                    Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    CustomTextField(
                      controller: emailController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset('assets/images/email.png'),
                      ),
                      hintText: 'Email',
                    ),
                    CustomTextField(
                      obscureText: isVisible,
                      controller: passwordController,
                      hintText: 'Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Image.asset('assets/images/password.png'),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Image.asset(
                            'assets/images/${isVisible ? 'un' : ''}visible.png',
                          ),
                        ),
                      ),
                    ),
                    CustomButton(
                      onpress: () {
                        GoRouter.of(context).push(Routers.customerInfo);
                      },
                      title: 'Create Account',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xffD1FAE5),
                            thickness: 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'or Sign up with',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w900,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xffD1FAE5),
                            thickness: 3,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        spacing: 32,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => InkWell(
                            onTap: () {
                              // Our Logic
                              GoRouter.of(context).push(Routers.customerInfo);
                            },
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0xFFE5E7EB),
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/${authMethodsIcon[index]}.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Color(0xff7A7A7A),
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).pop();
                          },
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              color: Color(0xff10B981),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
