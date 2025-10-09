import 'package:delvirick/core/utils/routes/go_router.dart';
import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_event.dart';
import 'package:delvirick/features/auth/presentation/bloc/auth_state.dart';
import 'package:delvirick/features/widgets/mini_top_app_background.dart';
import 'package:delvirick/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // 🧠 Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  // 🧩 Trigger registration
  void _onRegister() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final phone = phoneController.text.trim();
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();

    if (email.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    context.read<AuthBloc>().add(RegisterRequested(
          email: email,
          password: password,
          phone: phone,
          firstName: firstName,
          lastName: lastName,
          userType: 'customer',
        ));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Account created successfully!')),
            );
            GoRouter.of(context).pushReplacement(Routers.setlocation);
          } else if (state is AuthFailure) {
            print(' Error:................... ${state.message.toString()}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MiniTopAppBackground(),
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 👤 Name fields
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: firstNameController,
                          hintText: 'First name',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          controller: lastNameController,
                          hintText: 'Last name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // 📧 Email
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),

                  // 📞 Phone
                  CustomTextField(
                    controller: phoneController,
                    hintText: 'Enter your phone number',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 15),

                  // 🔒 Pa,ssword
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 25),

                  // 🚀 Create account button
                  CustomButton(
                    title: state is AuthLoading ? 'Creating...' : 'Create Account',
                    onpress: state is AuthLoading ? null : _onRegister,
                  ),
                  const SizedBox(height: 25),

                  // 🔁 Already have an account?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).push(Routers.login),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
