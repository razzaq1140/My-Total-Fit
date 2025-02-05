import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcons.star,
                      // AppIcons.sr,
                      height: 24,
                      width: 24,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppIcons.replace,
                      height: 24,
                      width: 24,
                    )),
              ],
            ),
            Row(
              children: [
                Image.asset(AppImages.aiChat, height: 24, width: 25),
                const SizedBox(width: 10),
                Text(
                  "MyTotalFit",
                  style: textTheme(context)
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(AppImages.explor, height: 24, width: 24),
                const SizedBox(width: 10),
                Text(
                  "Explore MyTotalFit",
                  style: textTheme(context)
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text("Today", style: textTheme(context).titleMedium),
            const SizedBox(height: 4),
            Text("Predida musculo sin entrenar",
                style: textTheme(context).bodyMedium),
            const SizedBox(height: 4),
            Text("Yesterday", style: textTheme(context).titleMedium),
            const SizedBox(height: 4),
            Text("Clausula 2 Reorganizada",
                style: textTheme(context).bodyMedium),
            const SizedBox(height: 4),
            Text("Respuesta a MilkCrack", style: textTheme(context).bodyMedium),
            const SizedBox(height: 7),
            Text("Last 30 Days", style: textTheme(context).titleMedium),
            const SizedBox(height: 4),
            Text("Bajar Peso Opciones", style: textTheme(context).bodyMedium),
            const SizedBox(height: 4),
            Text("Mejoras App De fitness",
                style: textTheme(context).bodyMedium),
            const SizedBox(height: 4),
            Text("Esperando foto ai QC", style: textTheme(context).bodyMedium),
            const SizedBox(height: 4),
            Text("Proteccion de Audiculares en envio",
                style: textTheme(context).bodyMedium),
            const SizedBox(height: 8),
            Text("Significado de medidas de ropa",
                style: textTheme(context).bodyMedium),
            const SizedBox(height: 20),
            ListTile(
              leading: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.appGrey.withOpacity(0.3),
                ),
                child: Image.asset(
                  AppImages.setting,
                  height: 8,
                  width: 8,
                ),
              ),
              title: Text(
                "Upgrade Plan",
                style: textTheme(context)
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("More Access to best plan",
                  style: textTheme(context)
                      .labelMedium
                      ?.copyWith(color: AppColors.appGrey)),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  AppImages.footerlogo,
                ),
              ),
              title: Text(
                "King Studio Games",
                style: textTheme(context)
                    .bodySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
