import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/subscription_plan/widgets/subscription_plan_widget.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class SubscriptionScreen extends StatefulWidget {
  final bool isUpgrade;
  const SubscriptionScreen({super.key, required this.isUpgrade});

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen>
    with SingleTickerProviderStateMixin {
  bool isYearly = false;
  bool skipFreeTrial = false;
  // String selectedPlan = "Elite";

  late TabController _tabController;
  bool isDiscounted = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscription Plans"),
        actions: [
          if (!widget.isUpgrade)
            IconButton(
              onPressed: () => context.pushNamed(AppRoute.elitePlan),
              icon: const Icon(
                Icons.cancel_outlined,
              ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: TabBar(
                dividerHeight: 0,
                controller: _tabController,
                indicatorColor: colorScheme(context).primary,
                labelColor: Colors.white,
                tabAlignment: TabAlignment.center,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: textTheme(context)
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                  color: colorScheme(context).primary,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                tabs: [
                  const Tab(text: 'MONTHLY'),
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Save up 25%",
                          style: textTheme(context).labelSmall!.copyWith(
                                color: const Color(0xffFFBB00),
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        const Text("ANNUAL"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SubscriptionPlanWidget(
                      isAnnual: false, isUpgrade: widget.isUpgrade),
                  //!
                  SubscriptionPlanWidget(
                      isAnnual: true, isUpgrade: widget.isUpgrade),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
