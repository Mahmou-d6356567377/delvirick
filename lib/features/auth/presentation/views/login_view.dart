import 'package:delvirick/core/widgets/custom_elevated_button.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_event.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_state.dart';
import 'package:delvirick/features/auth/presentation/widgets/dont_have_account_widget.dart';
import 'package:delvirick/features/auth/presentation/widgets/social_media_sign.dart';
import 'package:delvirick/features/auth/presentation/widgets/texted_devider.dart';
import 'package:delvirick/features/widgets/top_app_background.dart';
import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  void _onLoginPressed() {
    if (formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LoginRequested( emailController.text.trim(),passwordController.text.trim(),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // optional: show loading indicator
          } else if (state is AuthSuccess) {
            // Navigate on success
            GoRouter.of(context).push(Routers.customerInfo);
          } else if (state is AuthFailure) {
            // Show error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
              
            );
            print(state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                TopAppBackground(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      spacing: 20,
                      children: [
                        const Text(
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
                          obscureText: !isVisible,
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
                          backgroundColor: emailController.text.isNotEmpty
                              ? const Color(0xff10B981)
                              : const Color(0xffD1FAE5),
                          onPressed: state is AuthLoading ? null : _onLoginPressed,
                          child: state is AuthLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('Login'),
                        ),
                        const TextedDevider(text: 'or Login with'),
                        const SocialMediaSigning(),
                        const DontHaveAccount(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
