import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/feature/home/pages/catogery/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatogeryScreen extends StatefulWidget {
  const CatogeryScreen({super.key});

  @override
  State<CatogeryScreen> createState() => _CatogeryScreenState();
}

class _CatogeryScreenState extends State<CatogeryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => context.pop(context),
          child: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          "Categories",
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categoryList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 100,
                  width: 120,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme(context).primary,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(categoryList[index].image!),
                ),
                const SizedBox(height: 10),
                Text(
                  categoryList[index].text!,
                  style: textTheme(context).titleSmall,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
