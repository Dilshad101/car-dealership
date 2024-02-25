import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.sizeOf(context).width / 2,
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            var value = (state is RegisterUpdateState)
                ? state.data['contactType']
                : null;
            return DropdownButton2(
              hint: const Text('Select a catagory'),
              value: value,
              items: const [
                DropdownMenuItem(value: 'customer1', child: Text('Customer1')),
                DropdownMenuItem(value: 'customer2', child: Text('Customer2')),
                DropdownMenuItem(value: 'customer3', child: Text('Customer3'))
              ],
              onChanged: (value) {
                context.read<RegisterBloc>().add(
                    RegistercontactTypeEvent(contactType: value.toString()));
              },
            );
          },
        ));
  }
}
