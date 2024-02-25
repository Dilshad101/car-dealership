import 'package:flutter/material.dart';
import 'package:flutter_application_2/util/text_styles.dart';
import 'package:flutter_application_2/widgets/top_cars_tile.dart';
import 'package:flutter_application_2/widgets/all_brands_tile.dart';
import 'package:flutter_application_2/widgets/fuel_type_tile.dart';
import 'package:flutter_application_2/widgets/popular_segmants.dart';
import 'package:flutter_application_2/widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const AppSearchBar(),
          const SizedBox(height: 10),
          const Text('Popular Segmants',
              style: AppTextStyles.xLarge),
          const SizedBox(height: 10),
          PopularSegmants(),
          const SizedBox(height: 10),
          const Text('All Brands', style: AppTextStyles.xLarge),
          const SizedBox(height: 10),
          AllBrandsTile(),
          const SizedBox(height: 10),
          const Text('Fuel Type', style: AppTextStyles.xLarge),
          const SizedBox(height: 10),
          FuelTypeTile(),
          const SizedBox(height: 10),
          const Text('Top Cars', style: AppTextStyles.xLarge),
          const SizedBox(height: 10),
          const TopCarsTile()
        ],
      ),
    );
  }
}
