import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_animated_button.dart';
import 'package:my_total_fit/src/feature/subscription_plan/model/subscription_plan_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class SubscriptionPlanWidget extends StatefulWidget {
  final bool isAnnual;
  final bool isUpgrade;
  const SubscriptionPlanWidget(
      {super.key, required this.isAnnual, required this.isUpgrade});

  @override
  State<SubscriptionPlanWidget> createState() => _SubscriptionPlanWidgetState();
}

class _SubscriptionPlanWidgetState extends State<SubscriptionPlanWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isAnnual = widget.isAnnual;
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 570.0,
              enlargeCenterPage: false,
              enableInfiniteScroll: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: (subscriptionPlansMonthly).map((plan) {
              double discountedPrice = plan.price * 0.75;
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      plan.isRecommended
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppColors.appYellow,
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Text(
                                "MOST POPULAR",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17.5,
                                ),
                              ),
                            )
                          : const SizedBox(height: 40),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border:
                                  Border.all(width: 2, color: plan.borderClr)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(13)),
                                child: Image.asset(
                                  plan.backgroundImg,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      plan.title,
                                      style: textTheme(context)
                                          .headlineLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 40.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("\$",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 23,
                                              color: plan.borderClr,
                                            )),
                                        Text(
                                            isAnnual
                                                ? discountedPrice
                                                    .toStringAsFixed(2)
                                                : plan.price.toStringAsFixed(2),
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 53,
                                              color: plan.borderClr,
                                            )),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "/${plan.duration}",
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    if (isAnnual)
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "\$${plan.price}",
                                              style: textTheme(context)
                                                  .titleSmall!
                                                  .copyWith(
                                                      decorationThickness: 2,
                                                      decorationColor:
                                                          Colors.red,
                                                      decoration: TextDecoration
                                                          .lineThrough)),
                                          TextSpan(
                                              text:
                                                  " \$${discountedPrice.toStringAsFixed(2)} ",
                                              style: textTheme(context)
                                                  .titleSmall),
                                          // TextSpan(
                                          //     text: "save up 25%",
                                          //     style: textTheme(context)
                                          //         .titleMedium!
                                          //         .copyWith(
                                          //             color: Colors.green,
                                          //             fontWeight:
                                          //                 FontWeight.w600)),
                                        ])),
                                      ),
                                    const SizedBox(height: 20.0),
                                    ...List.generate(plan.features.length,
                                        (index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              plan.features[index].image,
                                              width: 33,
                                              height: 33,
                                              fit: BoxFit.contain,
                                            ),
                                            const SizedBox(width: 8.0),
                                            Expanded(
                                              child: Text(
                                                plan.features[index].label,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 21,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate((subscriptionPlansMonthly).length, (index) {
              return Container(
                width: _currentIndex == index ? 14 : 8.0,
                height: _currentIndex == index ? 14 : 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? subscriptionPlansMonthly[index].borderClr
                      : Colors.grey.shade400,
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check,
                  color: subscriptionPlansMonthly[_currentIndex].borderClr),
              Text(
                "No Payment Due Now",
                style: textTheme(context).titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: subscriptionPlansMonthly[_currentIndex].borderClr),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomAnimatedButton(
              color: subscriptionPlansMonthly[_currentIndex].borderClr,
              onTap: () {
                widget.isUpgrade
                    ? context.pop()
                    : context.pushNamed(AppRoute.signInPage);
              },
              text: "Try for \$0.00"),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
