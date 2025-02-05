import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/nutrition/pages/day_streak_page.dart';
import 'package:my_total_fit/src/nutrition/pages/food_database_page.dart';
import 'package:my_total_fit/src/nutrition/pages/scan_page.dart';
import 'package:my_total_fit/src/nutrition/provider/add_data_nutrition.dart';
import 'package:my_total_fit/src/nutrition/widget/custom_container.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<bool> selectedDays = [true, false, true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme(context).outline.withOpacity(0.1),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: colorScheme(context).primary,
        title: Text(
          'Meal Nutrition',
          style: textTheme(context).headlineSmall?.copyWith(
              letterSpacing: 0, color: colorScheme(context).onPrimary),
        ),
        actions: [
          InkWell(
            onTap: (){
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      child: CustomDayStreakContent(
                        selectedDays: selectedDays,
                        onDayChanged: (index, value) {
                          setState(() {
                            selectedDays[index] = value;
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 65,
              height: 35,
              decoration: BoxDecoration(
                  color: colorScheme(context).onPrimary,
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.fireColoringIcon),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '0',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 270,
                  decoration: BoxDecoration(
                      color: colorScheme(context).primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      )),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      // Row(
                      //   children: [
                      //     const SizedBox(
                      //       width: 10,
                      //     ),
                      //     const Spacer(),
                      //     ,
                      //     const SizedBox(
                      //       width: 10,
                      //     )
                      //   ],
                      // ),
                      const SizedBox(height: 20),
                      TableCalendar(
                        focusedDay: _focusedDay,
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        calendarFormat: CalendarFormat.week,
                        startingDayOfWeek: StartingDayOfWeek.thursday,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        headerVisible: false,
                        daysOfWeekHeight: 0, // Hide the default week labels
                        calendarStyle: CalendarStyle(
                          cellMargin: const EdgeInsets.all(0),
                          defaultDecoration: BoxDecoration(
                            color: colorScheme(context).primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          selectedDecoration: BoxDecoration(
                            color: colorScheme(context).onPrimary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          selectedTextStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          defaultTextStyle: TextStyle(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          weekendDecoration: BoxDecoration(
                            color: colorScheme(context).primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                          ),
                          weekendTextStyle: TextStyle(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                          outsideDaysVisible: false,
                        ),
                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            return _buildDayWidget(day, false);
                          },
                          todayBuilder: (context, day, focusedDay) {
                            return _buildDayWidget(day, false);
                          },
                          selectedBuilder: (context, day, focusedDay) {
                            return _buildDayWidget(day, true);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 190,
                  child: Container(
                    height: 130,
                    // width: 332,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme(context)
                              .outlineVariant
                              .withOpacity(0.3),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                          20), // Optional: Adds rounded corners
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2135',
                              style: textTheme(context).displayLarge?.copyWith(
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Calories Left',
                              style: textTheme(context).labelSmall?.copyWith(
                                  letterSpacing: 0,
                                  color: colorScheme(context).outlineVariant),
                            ),
                          ],
                        ),
                        CircularPercentIndicator(
                          radius: 35,
                          lineWidth: 5,
                          percent: 0.5,
                          backgroundColor: colorScheme(context).outlineVariant,
                          center: SvgPicture.asset(
                            AppIcons.fireBlackIcon,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainerWidget(
                          wight: '153g',
                          name: 'Proteins Left',
                          percent: 0.0,
                          image: AppIcons.proteinsLeftIcon),
                      CustomContainerWidget(
                          wight: '133g',
                          name: 'Carbs Left',
                          percent: 0.5,
                          image: AppIcons.carbsLeftIcon),
                      CustomContainerWidget(
                          wight: '116g',
                          name: 'Fat Left',
                          percent: 0.0,
                          image: AppIcons.fatLeftIcon),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Consumer<AddDataNutritionProvider>(
                    builder: (context, provider, child) {
                      return provider.foodDataList.isEmpty
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'You haven’t uploaded any food',
                                  style: textTheme(context)
                                      .titleMedium
                                      ?.copyWith(letterSpacing: 0),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Start tracking today’s meals by taking a quick picture.',
                                  style: textTheme(context)
                                      .labelSmall
                                      ?.copyWith(
                                          letterSpacing: 0,
                                          color: colorScheme(context)
                                              .outlineVariant),
                                ),
                                SvgPicture.asset(AppIcons.arrowIcon),
                              ],
                            )
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: provider.foodDataList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    height: 85,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: colorScheme(context)
                                          .outlineVariant
                                          .withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Water',
                                              style: textTheme(context)
                                                  .titleSmall
                                                  ?.copyWith(
                                                      letterSpacing: 0,
                                                      fontSize: 15),
                                            ),
                                            Text(
                                              '18:07',
                                              style: textTheme(context)
                                                  .titleSmall
                                                  ?.copyWith(
                                                      letterSpacing: 0,
                                                      fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                                AppIcons.fireBlackIcon),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              '502 Calories',
                                              style: textTheme(context)
                                                  .titleSmall
                                                  ?.copyWith(
                                                      letterSpacing: 0,
                                                      fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            customRow(
                                                icon: AppIcons.proteinsLeftIcon,
                                                title: '54g'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            customRow(
                                                icon: AppIcons.carbsIcon,
                                                title: '54g'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            customRow(
                                                icon: AppIcons.fatLeftIcon,
                                                title: '54g'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (context) => buildBottomSheet(context),
          );
        },
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: colorScheme(context).onPrimary,
        ),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    int? selectedIndex;

    void onTileTap(int index) {
      selectedIndex = index;
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Categories",
                  style: textTheme(context).titleMedium?.copyWith(
                      fontWeight: FontWeight.bold, letterSpacing: 0)),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).outlineVariant.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedIndex == 0
                        ? colorScheme(context).primary
                        : Colors.transparent,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: SvgPicture.asset(
                    AppIcons.foodIcon,
                    height: 30,
                    width: 30,
                  ),
                  title: Text("Food Database",
                      style: textTheme(context).titleSmall?.copyWith(
                          letterSpacing: 0, fontWeight: FontWeight.w600)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  tileColor: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: () {
                    setState(() {
                      onTileTap(0);
                      context.pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FoodDatabasePage(),
                          ));
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).outlineVariant.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedIndex == 1
                        ? colorScheme(context).primary
                        : Colors.transparent,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: SvgPicture.asset(
                    AppIcons.saveIcon,
                    height: 30,
                    width: 30,
                  ),
                  title: Text("Save Foods",
                      style: textTheme(context).titleSmall?.copyWith(
                          letterSpacing: 0, fontWeight: FontWeight.w600)),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 20),
                  tileColor: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: () {
                    setState(() {
                      onTileTap(1);
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme(context).outlineVariant.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedIndex == 2
                        ? colorScheme(context).primary
                        : Colors.transparent,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: SvgPicture.asset(
                    AppIcons.scanIcon,
                    height: 30,
                    width: 30,
                  ),
                  title: Text("Scan Food",
                      style: textTheme(context).titleSmall?.copyWith(
                          letterSpacing: 0, fontWeight: FontWeight.w600)),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 20),
                  tileColor: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onTap: () {
                    setState(() {
                      onTileTap(2);
                    });
                    context.pop();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Allows for height control
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height *
                              0.9, // Custom height of the bottom sheet
                          child:
                              const ScanScreen(), // Show your ScanScreen here
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDayWidget(DateTime day, bool isSelected) {
    final dayName =
        ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][day.weekday % 7];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      width: 60,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayName,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          //const SizedBox(height: 4),
          Text(
            '${day.day}',
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget customRow({required String icon, required String title}) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: textTheme(context).labelSmall?.copyWith(
              letterSpacing: 0,
              color: colorScheme(context).onSurface.withOpacity(0.5)),
        ),
      ],
    );
  }
}
