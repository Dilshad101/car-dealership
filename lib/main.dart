import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_application_2/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_application_2/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_application_2/view/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
