import 'package:flutter/material.dart';
import 'package:houses/core/app_validator.dart';
import 'package:houses/featuers/auth/presentation/views/widget/custom_textformField.dart';
import 'package:houses/featuers/auth/presentation/views/widget/customonpresed.dart';
import 'package:houses/featuers/root.dart';

class SighUpView extends StatefulWidget {
  const SighUpView({super.key});

  @override
  State<SighUpView> createState() => _SighUpViewState();
}

class _SighUpViewState extends State<SighUpView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
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
                vertical: size.height * 0.025,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: isSmall ? 20 : size.height * 0.05),

                    /// Icon
                    Container(
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_add_alt_1_rounded,
                        size: size.width * 0.14,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: size.height * 0.035),

                    /// Title
                    Text(
                      "Create Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.075,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: size.height * 0.01),

                    Text(
                      "Sign up to get started",
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
                      padding: EdgeInsets.all(size.width * 0.055),
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
                            controller: nameController,
                            textLable: "Full Name",
                            iconprefix: Icons.person_outline,
                            validator: AppValidator.passwordValidator,
                          ),
                          SizedBox(height: size.height * 0.025),
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
                          SizedBox(height: size.height * 0.04),

                          /// Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            child: CustomOnpresed(
                              textContaner: "Create Account",
                              onTap: () {
                                // if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
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

                    SizedBox(height: size.height * 0.03),
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
