import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_application_2/widgets/car_tile.dart';
import 'package:flutter_application_2/widgets/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({
    super.key,
    required this.catagory,
    required this.profiles,
  });
  final String catagory;
  final List profiles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
        title: Text(catagory),
        centerTitle: true,
      ),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is SignleProfileSuccessState) {
            AppMessenger.showMessage(context,
                'Profile Fetched By Id: ${state.result['companyBasicId']}');
          } else if (state is ProfileFailedState) {
            AppMessenger.showMessage(context, state.error, isError: true);
          }
        },
        child: GridView.builder(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.2,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.read<ProfileBloc>().add(GetProfileByIdEvent(
                      profiles: profiles,
                      companyBasicId: profiles[index]['companyBasicId'],
                    ));
              },
              child: CarTile(
                imageUrl: index % 3 == 0
                    ? 'https://www.freepnglogos.com/uploads/bmw-png/bmw-reviews-and-rating-motor-trend-1.png'
                    : 'https://www.picng.com/upload/hyundai/png_hyundai_20629.png',
                name: 'Toyota Fortuner',
                price: 'Rs 31 - 44 Lacks',
              ),
            );
          },
          itemCount: profiles.length,
        ),
      ),
    );
  }
}
