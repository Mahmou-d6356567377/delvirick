import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/features/auth/presentation/widgets/top_section_auth_view.dart';
import 'package:delvirick/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
            TopSectionAuthView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      'Login to your Account',
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
                    CustomElevatedButton(
                      backgroundColor:
                          emailController.text.isNotEmpty
                              ? Color(0xff10B981)
                              : Color(0xffD1FAE5),
                      onPressed: () {
                        // Our Logic
                        GoRouter.of(context).push(Routers.customerInfo);
                      },
                      child: Text('Login'),
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
                            'or Login with',
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
                    Row(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account? ',
                          style: TextStyle(
                            color: Color(0xff7A7A7A),
                            fontSize: 15,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(Routers.register);
                          },
                          child: Text(
                            'Sign Up',
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
