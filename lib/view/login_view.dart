import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_application_2/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_application_2/util/validations.dart';
import 'package:flutter_application_2/view/bottom_nav_view.dart';
import 'package:flutter_application_2/widgets/app_text_field.dart';
import 'package:flutter_application_2/widgets/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _loginKey,
          child: Column(
            children: [
              AppTextField(
                controller: emailController,
                label: 'Email',
                validator: (value) => Validation.isEmpty(value),
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: passwordController,
                label: 'Password',
                validator: (value) => Validation.isEmpty(value),
              ),
              const SizedBox(height: 20),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginFailureState) {
                    AppMessenger.showMessage(
                      context,
                      'Invalid Credentials',
                      isError: true,
                    );
                  } else if (state is LoginSuccessState) {
                    context
                        .read<ProfileBloc>()
                        .add(GetAllProfileEvent(token: state.token));
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) =>  BottomNavScreen(),
                      ),
                    );
                    AppMessenger.showMessage(context, 'Login success');
                  }
                },
                builder: (context, state) {
                  bool loading = state is LoginLoadingState;
                  return SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_loginKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginUserEvent(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },
                        child: loading
                            ? Transform.scale(
                                scale: .6,
                                child: const CircularProgressIndicator(),
                              )
                            : const Text('Login')),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
