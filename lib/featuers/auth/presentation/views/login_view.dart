import 'package:flutter/material.dart';
import 'package:houses/core/app_validator.dart';
import 'package:houses/featuers/auth/presentation/views/forgot_password.dart';
import 'package:houses/featuers/auth/presentation/views/sigh_up_view.dart';
import 'package:houses/featuers/auth/presentation/views/widget/custom_textformField.dart';
import 'package:houses/featuers/auth/presentation/views/widget/customonpresed.dart';
import 'package:houses/featuers/root.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.height < 700;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: size.height * 0.02,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: isSmall ? 20 : size.height * 0.06),

                    /// Logo
                    Container(
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.home_rounded,
                        size: size.width * 0.14,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),

                    /// Title
                    Text(
                      "Welcome Back",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.075,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: size.height * 0.01),

                    Text(
                      "Login to continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),

                    /// Form Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: emailController,
                            textLable: "Email",
                            iconprefix: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: AppValidator.emailValidator,
                          ),
                          SizedBox(height: size.height * 0.025),
                          CustomTextFormField(
                            controller: passwordController,
                            textLable: "Password",
                            iconprefix: Icons.lock_outline,
                            keyboardType: TextInputType.visiblePassword,
                            validator: AppValidator.passwordValidator,
                          ),
                          SizedBox(height: size.height * 0.01),

                          /// Forgot Password
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const ForgotPassword(),
                                  ),
                                );
                              },
                              child: const Text("Forgot Password?"),
                            ),
                          ),

                          SizedBox(height: size.height * 0.015),

                          /// Login Button
                          SizedBox(
                            width: double.infinity,
                            child: CustomOnpresed(
                              textContaner: "Login",
                              onTap: () {
                                // if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Root()),
                                );
                              },
                              // },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),

                    /// Sign Up
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => SighUpView()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
