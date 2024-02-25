
import 'package:flutter/material.dart';
import 'package:flutter_application_2/util/text_styles.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(Icons.search, size: 30),
                hintText: 'Search Products',
                hintStyle: AppTextStyles.large
                    .copyWith(color: Colors.grey.shade600),
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.tune,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
