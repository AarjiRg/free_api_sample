import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_api_sample/bloc/login_event.dart';
import 'package:free_api_sample/bloc/login_state.dart';
import 'package:free_api_sample/model/loginmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    
    on<OnUserLoginEvent>((event, emit) async {
                final prefs = await SharedPreferences.getInstance();

      emit(LoginLoadingState());
      final url = Uri.parse("https://freeapi.luminartechnohub.com/login");
      
      try {
        final response = await http.post(url, body: {
          "email": event.email,
          "password": event.password,
        });
        
        log('Response status: ${response.statusCode}');
        
        if (response.statusCode == 200) {
          final Loginmodel model = loginmodelFromJson(response.body);

          await prefs.setString('access', model.access.toString());

          emit(LoginSuccessState());
        } else {
          emit(LoginInitial());
          log('Login failed with status code: ${response.statusCode}');
        }
      } catch (e) {
        log('Error during login: $e');
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}