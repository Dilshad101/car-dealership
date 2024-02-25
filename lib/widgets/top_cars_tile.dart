import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/car_tile.dart';

class TopCarsTile extends StatelessWidget {
  const TopCarsTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.2),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) => const CarTile(
        imageUrl:
            'https://freepngimg.com/thumb/car/31510-9-car-transparent-background.png',
        name: 'Hyundai',
        price: 'price',
      ),
    );
  }
}
