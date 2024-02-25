import 'package:flutter/material.dart';
import 'package:flutter_application_2/bloc/profile_bloc/profile_bloc.dart';
import 'package:flutter_application_2/util/text_styles.dart';
import 'package:flutter_application_2/view/view_more_view.dart';
import 'package:flutter_application_2/widgets/car_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/top_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (previous, current) => current is! SignleProfileSuccessState,
        builder: (context, state) {
          if (state is ProfileSuccessState) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Text('Hi, Jenifer !', style: AppTextStyles.xxl),
                const SizedBox(height: 5),
                const Text('Search your favorite car here',
                    style: AppTextStyles.small),
                const SizedBox(height: 15),
                const TopContainer(),
                const SizedBox(height: 15),
                rawTitle(
                  title: 'The Most Searched Cars',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewMoreScreen(
                          profiles: state.result,
                          catagory: 'Most Searched cars',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Expanded(
                      child: CarTile(
                        imageUrl:
                            'https://www.picng.com/upload/hyundai/png_hyundai_20629.png',
                        name: 'Hyundai i20',
                        price: 'RS 6.2 - 11 Lacks',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CarTile(
                        imageUrl:
                            'https://www.freepnglogos.com/uploads/bmw-png/bmw-reviews-and-rating-motor-trend-1.png',
                        name: 'Toyota Fortuner',
                        price: 'Rs 31 - 44 Lacks',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                rawTitle(
                  title: 'Recommended cars for you',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ViewMoreScreen(
                          profiles: state.result,
                          catagory: 'Recomonded Cars',
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Expanded(
                      child: CarTile(
                        imageUrl:
                            'https://www.freepnglogos.com/uploads/bmw-png/bmw-reviews-and-rating-motor-trend-1.png',
                        name: 'Hyundai i20',
                        price: 'RS 6.2 - 11 Lacks',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CarTile(
                        imageUrl:
                            'https://www.picng.com/upload/hyundai/png_hyundai_20629.png',
                        name: 'Toyota Fortuner',
                        price: 'Rs 31 - 44 Lacks',
                      ),
                    )
                  ],
                ),
              ],
            );
          } else if (state is ProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Failed to load data please try agin'),
            );
          }
        },
      ),
    );
  }

  Row rawTitle({required String title, void Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: AppTextStyles.large.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        InkWell(
          onTap: onTap,
          child: const Text(
            'View All',
            style: TextStyle(
              fontSize: 12,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
