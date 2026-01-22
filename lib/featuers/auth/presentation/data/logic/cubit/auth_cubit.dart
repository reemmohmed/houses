import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/featuers/auth/presentation/data/services/api_auth.dart';
import 'package:houses/featuers/auth/presentation/data/models/user_model.dart';
import 'package:houses/featuers/auth/presentation/data/services/token_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiAuth _apiAuth;

  AuthCubit(this._apiAuth) : super(AuthInitial());

  // فحص إذا فيه جلسة محفوظة
  Future<void> checkLoggedIn() async {
    emit(AuthLoading());
    final token = await TokenStorage.getToken();
    final savedUser = await TokenStorage.getUser();

    if (token != null && savedUser != null) {
      emit(AuthLoggedIn(UserModel.fromJson(savedUser)));
    } else {
      emit(AuthInitial());
    }
  }

  //  creat new singhUp
  Future<void> signUp(String email, String password, String name) async {
    emit(AuthLoading());
    try {
      final data = await _apiAuth.signUp(email, password, name);
      log('signUp response data: $data');

      if (data != null && data['user'] != null) {
        final user = UserModel.fromJson(data['user']);
        // ممكن تخزن بيانات المستخدم محلياً إذا حبيت
        emit(AuthLoggedIn(user)); // ترسل بيانات المستخدم عشان يعرض البروفايل
      } else {
        emit(AuthFailure('Something went wrong'));
      }
    } catch (e) {
      log('Error in AuthCubit.signUp: $e');
      emit(AuthFailure(e.toString()));
    }
  }

  // تسجيل دخول
  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      final data = await _apiAuth.signIn(email, password);
      log('Login API response: $data');

      if (data != null && data['token'] != null && data['user'] != null) {
        await TokenStorage.saveToken(data['token']);
        await TokenStorage.saveUser(data['user']);
        emit(AuthLoggedIn(UserModel.fromJson(data['user'])));
      } else if (data != null) {
        // تأكد إن الرسالة موجودة وأمّن الوصول لها
        final errorMessage =
            data['message'] ??
            data['error'] ??
            'Invalid credentials or unknown error';
        emit(AuthFailure(errorMessage));
      } else {
        // لو data null
        emit(AuthFailure('No response from server'));
      }
    } catch (e) {
      log('Error in AuthCubit.signIn: $e');
      // عرض رسالة عامة بدل عرض الخطأ التقني
      emit(
        AuthFailure(
          'Failed to login. Please check your credentials and try again.',
        ),
      );
    }
  }

  // تسجيل خروج
  Future<void> logout() async {
    await TokenStorage.clearAll();
    emit(AuthInitial());
  }
}
