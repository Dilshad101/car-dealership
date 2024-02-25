
import 'package:flutter/material.dart';
import 'package:flutter_application_2/util/text_styles.dart';

class CarTile extends StatelessWidget {
  const CarTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
  final String imageUrl;
  final String name;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.favorite_border),
            ),
          )),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  price,
                  style: AppTextStyles.small.copyWith(fontSize: 12),
                ),
                Text(
                  'Avarage Ex-Showroom Price',
                  style: AppTextStyles.small.copyWith(fontSize: 8),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
