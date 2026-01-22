import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/core/app_validator.dart';
import 'package:houses/core/navebare_view.dart';
import 'package:houses/core/titel_text_widget.dart';
import 'package:houses/featuers/auth/presentation/data/logic/cubit/auth_cubit.dart';
import 'package:houses/featuers/auth/presentation/views/sigh_up_view.dart';

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
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              // إذا حدث خطأ (مثلاً: "المستخدم غير مسجل")
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error)));
            } else if (state is AuthSuccess) {
              // إذا تسجيل الدخول ناجح
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => NavebareView()),
              );
            }
          },
          child: Padding(
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
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signIn(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                          // لا تضع التنقل هنا!
                        }
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
      ),
    );
  }
}

class CustomOnpresed extends StatelessWidget {
  const CustomOnpresed({super.key, required this.textContaner, this.onTap});
  final String textContaner;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 150, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: TitelTextWidget(text: textContaner),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.validator,

    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.hintText,
    this.iconprefix,
    this.textLable,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final String? hintText;
  final IconData? iconprefix;
  final String? textLable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 2.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(textLable ?? ""),
        ),
        prefixIcon: Icon(iconprefix),
        hint: Text(hintText ?? ""),
        hintStyle: TextStyle(backgroundColor: Colors.black),
      ),
    );
  }
}
