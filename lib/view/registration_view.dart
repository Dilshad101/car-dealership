import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_application_2/util/validations.dart';
import 'package:flutter_application_2/widgets/app_text_field.dart';
import 'package:flutter_application_2/widgets/drop_down_button.dart';
import 'package:flutter_application_2/widgets/registration_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/label_checkbox.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final nameController = TextEditingController();
  final loginNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final storeController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const LabelCheckBox(),
          const CustomDropdownButton(),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: nameController,
                        label: 'User name',
                        validator: (value) => Validation.isEmpty(value),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTextField(
                        controller: loginNameController,
                        label: 'Login name',
                        validator: (value) => Validation.isEmpty(value),
                      ),
                    ),
                  ],
                ),
                AppTextField(
                  controller: emailController,
                  label: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validation.isEmpty(value),
                ),
                AppTextField(
                  controller: mobileController,
                  label: 'Mobile Number',
                  keyboardType: TextInputType.number,
                  validator: (value) => Validation.isEmpty(value),
                ),
                AppTextField(
                  controller: passwordController,
                  label: 'Password',
                  validator: (value) => Validation.isEmpty(value),
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: storeController,
                        label: 'Store Name',
                        validator: (value) => Validation.isEmpty(value),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                        onPressed: () {
                          showStoreBottomSheet(context);
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                    const SizedBox(width: 10),
                    IconButton(
                        color: Colors.blue,
                        onPressed: () {
                          if (storeController.text.trim().isNotEmpty) {
                            context.read<RegisterBloc>().add(
                                  AddStoreEvent(
                                      storeName: storeController.text),
                                );
                          }
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: cityController,
                        label: 'City',
                        validator: (value) => Validation.isEmpty(value),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: AppTextField(
                        controller: stateController,
                        label: 'State',
                        validator: (value) => Validation.isEmpty(value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    registerButton(),
                    OutlinedButton(
                        onPressed: () {
                          context
                              .read<RegisterBloc>()
                              .add(RegisterCleanEvent());
                        },
                        child: const Text('Clear All'))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget registerButton() {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.green,
                content: Text('Registration Successfull')),
          );
          nameController.clear();
          loginNameController.clear();
          emailController.clear();
          mobileController.clear();
          passwordController.clear();
          storeController.clear();
          cityController.clear();
          stateController.clear();
        }
        if (state is RegisterFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(state.message)),
          );
        }
      },
      buildWhen: (previous, current) => current is! RegisterFailedState,
      builder: (context, state) {
        bool isLoading = state is LoadingState;
        return ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              context.read<RegisterBloc>().add(
                    UserRegisterEvent(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      mobile: mobileController.text,
                      city: cityController.text,
                      state: stateController.text,
                      storeName: storeController.text,
                      loginName: loginNameController.text,
                    ),
                  );
            }
          },
          child: isLoading
              ? Transform.scale(
                  scale: .4,
                  child: const CircularProgressIndicator(),
                )
              : const Text('Register'),
        );
      },
    );
  }
}
