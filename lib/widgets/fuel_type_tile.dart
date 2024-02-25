
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_choice_chip.dart';

class FuelTypeTile extends StatelessWidget {
  FuelTypeTile({
    super.key,
  });
  final selectedItems = ValueNotifier([]);
  final fuelTypes = ['CNG', 'Petrol', 'Diesel', 'Electric', 'Hybrid'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.maxFinite,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ValueListenableBuilder(
            valueListenable: selectedItems,
            builder: (context, value, _) {
              return GestureDetector(
                onTap: () {
                  if (value.contains(fuelTypes[index])) {
                    value.removeWhere((element) => element == fuelTypes[index]);
                  } else {
                    value.add(fuelTypes[index]);
                  }
                  selectedItems.value = List.from(value);
                },
                child: CustomChoiceChips(
                    item: fuelTypes[index],
                    selected: value.contains(fuelTypes[index])),
              );
            }),
        itemCount: fuelTypes.length,
      ),
    );
  }
}
