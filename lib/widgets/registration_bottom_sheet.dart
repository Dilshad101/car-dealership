import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

showStoreBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterUpdateState) {
          state.data['stores'] ??= [];
          final stores = state.data['stores'];
          return Container(
            padding: const EdgeInsets.all(20),
            height: 300,
            child: ListView.builder(
              itemBuilder: (context, index) => Text(
                stores[index]['Text'],
                overflow: TextOverflow.ellipsis,
              ),
              itemCount: stores.length,
            ),
          );
        }
        return Container(
          width: double.maxFinite,
          height: 300,
          padding: const EdgeInsets.all(20),
          child: const Center(child: Text("You haven't added any Stores")),
        );
      },
    ),
  );
}
