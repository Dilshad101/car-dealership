import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_choice_chip.dart';

class PopularSegmants extends StatelessWidget {
  PopularSegmants({
    super.key,
  });
  final selectedItems = ValueNotifier([]);
  final List<String> segmants = [
    "SUV",
    "Sedan",
    "HatchBack",
    "Convertable",
    "MiniVan",
    "Compact SUV",
    "Truck",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        segmants.length,
        (index) => ValueListenableBuilder(
          valueListenable: selectedItems,
          builder: (context, value, _) {
            return GestureDetector(
              onTap: () {
                if (value.contains(segmants[index])) {
                  value.removeWhere((element) => element == segmants[index]);
                } else {
                  value.add(segmants[index]);
                }
                selectedItems.value = List.from(value);
              },
              child: CustomChoiceChips(
                item: segmants[index],
                selected: value.contains(segmants[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
