import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/core/my_observer.dart';
import 'package:houses/featuers/auth/presentation/data/logic/cubit/auth_cubit.dart';
import 'package:houses/featuers/auth/presentation/data/services/api_auth.dart';
import 'package:houses/featuers/auth/presentation/views/login_view.dart';
import 'package:houses/featuers/home/presentation/data/logic/cubit/home_cubit.dart';
import 'package:houses/featuers/home/presentation/data/servers/api_home.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(const Houses());
}

class Houses extends StatelessWidget {
  const Houses({super.key});

  @override
  Widget build(BuildContext context) {
    final apiAuth = ApiAuth();
    final apiHome = ApiHome();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit(apiAuth)..checkLoggedIn()),
        BlocProvider(create: (_) => HomeCubit(apiHome)),
      ],
      child: MaterialApp(
        // theme: ThemeData(fontFamily: "pacifico"),
        debugShowCheckedModeBanner: false,
        // home: NavebareView(),
        home: LoginView(),
      ),
    );
  }
}
