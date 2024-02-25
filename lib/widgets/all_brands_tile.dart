
import 'package:flutter/material.dart';
import 'package:flutter_application_2/util/text_styles.dart';

class AllBrandsTile extends StatelessWidget {
  AllBrandsTile({
    super.key,
  });
  final List<String> carImages = [
    'https://logos-world.net/wp-content/uploads/2021/03/Hyundai-Logo.png',
    'https://logohistory.net/wp-content/uploads/2023/01/Tata-Emblem.png',
    'https://brandlogos.net/wp-content/uploads/2021/04/kia-brandlogo.net_-512x512.png',
    'https://freelogopng.com/images/all_img/1686109983toyota-car-logo.png',
    'https://pngimg.com/uploads/suzuki/suzuki_PNG12291.png'
  ];
  final carBrands = ['Hyundai', 'TATA', 'KIA', 'Toyota', 'Suzuki'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(carImages[index], fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                carBrands[index],
                style: AppTextStyles.large.copyWith(color: Colors.black),
              )
            ],
          ),
        ),
        itemCount: carImages.length,
      ),
    );
  }
}
