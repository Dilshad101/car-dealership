import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabelCheckBox extends StatelessWidget {
  const LabelCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (previous, current) => current is! RegisterFailedState,
      builder: (context, state) {
        bool isSelected =
            (state is RegisterUpdateState) ? state.data['isEnableProductUpload']??false : false;
        return CheckboxListTile(
          title: const Text('isEnableProductUpload'),
          value: isSelected,
          onChanged: (v) {
            context.read<RegisterBloc>().add(
                  RegisterCheckBoxEvent(isSelected: v ?? false),
                );
          },
        );
      },
    );
  }
}
