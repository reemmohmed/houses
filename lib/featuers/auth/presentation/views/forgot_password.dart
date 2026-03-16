import 'package:flutter/material.dart';
import 'package:houses/featuers/auth/presentation/views/widget/custom_textformField.dart';
import 'package:houses/featuers/auth/presentation/views/widget/customonpresed.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.08),

                /// Icon
                Container(
                  padding: EdgeInsets.all(size.width * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_open_rounded,
                    size: size.width * 0.14,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                /// Title
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontSize: size.width * 0.075,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: size.height * 0.01),

                Text(
                  "Enter your email to reset your password",
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: size.height * 0.05),

                /// Email Input
                Form(
                  key: _formKey,
                  child: CustomTextFormField(
                    controller: emailController,
                    textLable: "Email",
                    iconprefix: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^\S+@\S+\.\S+\$').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.05),

                /// Reset Button
                SizedBox(
                  width: double.infinity,
                  child: CustomOnpresed(
                    textContaner: "Reset Password",
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      //   // Implement your reset logic here
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Password reset link sent!'),
                      //     ),
                      //   );
                      // }
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                /// Back to Login
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back to Login",
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
