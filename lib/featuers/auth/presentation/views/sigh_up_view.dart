import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/core/app_validator.dart';
import 'package:houses/core/titel_text_widget.dart';
import 'package:houses/featuers/auth/presentation/data/logic/cubit/auth_cubit.dart';
import 'package:houses/featuers/auth/presentation/views/login_view.dart';
import 'package:houses/featuers/auth/presentation/views/widget/custom_textformField.dart';
import 'package:houses/featuers/auth/presentation/views/widget/customonpresed.dart';
import 'package:houses/featuers/home/presentation/views/home_view.dart';
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),

          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  TitelTextWidget(text: "Welcome To Back"),
                  SizedBox(height: 50),
                  CustomTextFormField(
                    validator: AppValidator.passwordValidator,
                    textLable: "name",
                    controller: nameController,
                    iconprefix: Icons.person,
                  ),
                  SizedBox(height: 50),
                  CustomTextFormField(
                    validator: AppValidator.emailValidator,
                    textLable: "Email",
                    controller: emailController,
                    iconprefix: Icons.email,
                  ),
                  SizedBox(height: 50),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: AppValidator.passwordValidator,
                    textLable: "password",
                    iconprefix: Icons.password,
                  ),
                  SizedBox(height: 250),
                  CustomOnpresed(
                    textContaner: "Sign UP",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Root();
                          },
                        ),
                      );
                      // if (_formKey.currentState!.validate()) {
                      //   context.read<AuthCubit>().signUp(
                      //     emailController.text.trim(),
                      //     passwordController.text.trim(),
                      //     nameController.text.trim(),
                      //   );
                      // }
                    },
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
