import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/core/app_validator.dart';
import 'package:houses/core/navebare_view.dart';
import 'package:houses/core/titel_text_widget.dart';
import 'package:houses/featuers/auth/presentation/data/logic/cubit/auth_cubit.dart';
import 'package:houses/featuers/auth/presentation/views/sigh_up_view.dart';
import 'package:houses/featuers/auth/presentation/views/widget/custom_textformField.dart';
import 'package:houses/featuers/auth/presentation/views/widget/customonpresed.dart';
import 'package:houses/featuers/home/presentation/views/home_view.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  TitelTextWidget(text: "Welcome Back"),
                  SizedBox(height: 50),
                  CustomTextFormField(
                    controller: emailController,
                    textLable: "Email",
                    iconprefix: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidator.emailValidator,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    controller: passwordController,
                    textLable: "Password",
                    iconprefix: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    validator: AppValidator.passwordValidator,
                  ),
                  SizedBox(height: 50),
                  CustomOnpresed(
                    textContaner: "Login",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Root();
                          },
                        ),
                      );
                      //  if (_formKey.currentState!.validate()) {
                      //    context.read<AuthCubit>().signIn(
                      //      emailController.text.trim(),
                      //      passwordController.text.trim(),
                      //    );
                      //    // لا تضع التنقل هنا!
                      //  }
                    },
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => SighUpView()),
                          );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
