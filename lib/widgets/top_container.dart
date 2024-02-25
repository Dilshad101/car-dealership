import 'package:flutter/material.dart';
import 'package:flutter_application_2/util/text_styles.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xfff3c677)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ('Explore Latest'),
                style: AppTextStyles.xLarge,
              ),
              Text(
                'Cars with price',
                style: AppTextStyles.large,
              ),
              const SizedBox(height: 5),
              Container(
                height: 30,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Explore',
                  style: AppTextStyles.small.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 20,
          height: 120,
          width: MediaQuery.sizeOf(context).width / 2.2,
          child: Image.network(
              'https://www.pngall.com/wp-content/uploads/8/SUV-Car-PNG-Pic.png'),
        )
      ],
    );
  }
}
