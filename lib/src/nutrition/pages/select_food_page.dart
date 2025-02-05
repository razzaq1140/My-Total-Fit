import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/nutrition/provider/add_data_nutrition.dart';
import 'package:provider/provider.dart';

class SelectedFoodScreen extends StatefulWidget {
  final String name;
  final String calories;
  final String time;
  const SelectedFoodScreen(
      {super.key,
      required this.name,
      required this.calories,
      required this.time});

  @override
  State<SelectedFoodScreen> createState() => _SelectedFoodScreenState();
}

class _SelectedFoodScreenState extends State<SelectedFoodScreen> {
  int _selectedIndex = 1;
  int count = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).onPrimary,
      appBar: AppBar(
        backgroundColor: colorScheme(context).onPrimary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme(context).onSurface),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          "Selected Food",
          style: textTheme(context)
              .headlineMedium
              ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: textTheme(context)
                      .headlineMedium
                      ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(
                    Icons.bookmark,
                    color: colorScheme(context).outlineVariant,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ChoiceChip(
                    showCheckmark: false,
                    padding: EdgeInsets.zero,
                    label: Text(
                      'Boneless, Cooked',
                      style: textTheme(context).bodyLarge?.copyWith(
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex == 0
                                ? Colors.white
                                : Colors.black,
                          ),
                    ),
                    selected: _selectedIndex == 0,
                    selectedColor: colorScheme(context).primary,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedIndex = selected ? 0 : -1;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Circular border
                    ),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    showCheckmark: false,
                    label: Text(
                      'G',
                      style: textTheme(context).bodyLarge?.copyWith(
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.black,
                          ),
                    ),
                    selected: _selectedIndex == 1,
                    selectedColor: colorScheme(context).primary,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedIndex = selected ? 1 : -1;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Circular border
                    ),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    showCheckmark: false,
                    label: Text(
                      'Cup, Cooked, Diced',
                      style: textTheme(context).bodyLarge?.copyWith(
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            color: _selectedIndex == 2
                                ? Colors.white
                                : Colors.black,
                          ),
                    ),
                    selected: _selectedIndex == 2,
                    selectedColor: colorScheme(context).primary,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedIndex = selected ? 2 : -1;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Circular border
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Serving Amount',
                  style: textTheme(context)
                      .titleSmall
                      ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: colorScheme(context).onSurface),
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            count--;
                          });
                        },
                      ),
                      Text(
                        count.toString(),
                        style: textTheme(context).titleSmall?.copyWith(
                              letterSpacing: 0,
                            ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (count < 1) {
                              count = 1; // Set count to 1 if it's less than 1
                            } else {
                              count++; // Increment count if it's already 1 or more
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: colorScheme(context).outlineVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.fireBlackIcon),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calories',
                            style: textTheme(context).titleSmall?.copyWith(
                                letterSpacing: 0,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.5)),
                          ),
                          Text(
                            widget.calories,
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.edit,
                        color: colorScheme(context).onSurface.withOpacity(0.5)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Nutrients Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NutrientCard('Proteins', '153g', AppIcons.proteinsIcon),
                NutrientCard('Carbs', '153g', AppIcons.carbsIcon),
                NutrientCard('Fat', '153g', AppIcons.fatIcon),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Other nutrients facts',
              style: textTheme(context)
                  .titleMedium
                  ?.copyWith(letterSpacing: 0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const NutrientInfoTile('Saturated Fat', '10g'),
            const NutrientInfoTile('Polyunsaturated', '10g'),
            const NutrientInfoTile('Monounsaturated', '10g'),
            Consumer<AddDataNutritionProvider>(
              builder: (context, provider, child) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: colorScheme(context).primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      provider.addFoodData(
                          widget.name, widget.calories, widget.time);
                      context.pop();
                    },
                    child: const Text(
                      'Log',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class NutrientCard extends StatelessWidget {
  final String name;
  final String amount;
  final String icon;

  const NutrientCard(this.name, this.amount, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
          color: colorScheme(context).outlineVariant.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor:
                  colorScheme(context).outlineVariant.withOpacity(0.5),
              child: SvgPicture.asset(icon),
            ),
          ),
          const SizedBox(height: 6),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.edit,
                size: 15,
                color: colorScheme(context).onSurface.withOpacity(0.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                amount,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NutrientInfoTile extends StatelessWidget {
  final String title;
  final String amount;

  const NutrientInfoTile(this.title, this.amount, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: colorScheme(context).outlineVariant.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: textTheme(context).titleMedium?.copyWith(
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                    color: colorScheme(context).onSurface.withOpacity(0.5))),
            Text(amount,
                style: textTheme(context).titleMedium?.copyWith(
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                    color: colorScheme(context).onSurface)),
          ],
        ),
      ),
    );
  }
}
