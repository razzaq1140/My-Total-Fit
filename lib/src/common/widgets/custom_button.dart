import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double? textSize;
  final double? letterSpacing;
  final double? borderRadius;
  final double? elevation;
  final Color? textColor;
  final FontWeight? fontWeight;
  final List<Color>? gradientColors;
  final Color? color;
  final double padding;
  final double? width;
  final double? height;
  final IconData? icon;
  final Widget? iconWidget;
  final double? iconSize;
  final Color? iconColor;
  final bool isIconRight;
  final bool isDisabled; // Removed borderColor and borderWidth
  final Color? borderColor; // New parameter for border color
  final double? borderWidth; // New parameter for border width

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.elevation,
    this.iconWidget,
    this.textColor,
    this.fontWeight,
    this.textSize,
    this.letterSpacing,
    this.borderRadius,
    this.gradientColors,
    this.color,
    this.padding = 0,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isIconRight = false,
    this.isDisabled = false,
    this.borderColor, // Initialize border color
    this.borderWidth = 1.0, // Initialize border width with default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: width ?? double.infinity,
      padding: EdgeInsets.all(padding),
      child: ElevatedButton(
        onPressed: isDisabled
            ? null
            : onTap, // Disable the button when isDisabled is true
        style: ElevatedButton.styleFrom(
          // backgroundColor: colorScheme(context).primary,
          backgroundColor: color ?? colorScheme(context).primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(55),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 100),
            side: BorderSide(
              color: borderColor ?? Colors.transparent, // Apply border color
              width: borderWidth ?? 1.0, // Apply border width
            ),
            // side: BorderSide.none, // No border will be applied here
          ),

          elevation: elevation ?? 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.kantumruyPro(
            color: textColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: textSize ?? (18 - padding + 1),
            letterSpacing: letterSpacing ?? 0,
          ),
        ),
        // child: isIconRight
        //     ? _buildTextWithIcon(context)
        //     : _buildIconWithText(context),
      ),
    );
  }

  // Widget _buildIconWithText(BuildContext context) {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       if (icon != null) ...[
  //         iconWidget ??
  //             Icon(
  //               icon,
  //               size: iconSize ?? 20,
  //               color: iconColor ??
  //                   (isDisabled
  //                       ? colorScheme(context).outline
  //                       : colorScheme(context).onPrimary),
  //             ),
  //         const SizedBox(width: 8),
  //       ],
  //       Text(
  //         text,
  //         style: GoogleFonts.kantumruyPro(
  //           color: isDisabled
  //               ? colorScheme(context).outline
  //               : textColor ?? colorScheme(context).surface,
  //           fontWeight: fontWeight ?? FontWeight.w600,
  //           fontSize: textSize ?? 20,
  //           letterSpacing: letterSpacing ?? 0,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildTextWithIcon(BuildContext context) {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       if (icon != null || iconWidget != null) ...[
  //         const SizedBox(width: 8),
  //         iconWidget ??
  //             Icon(
  //               icon,
  //               size: iconSize ?? 20,
  //               color: iconColor ??
  //                   (isDisabled
  //                       ? colorScheme(context).outline
  //                       : colorScheme(context).onPrimary),
  //             ),
  //       ],
  //       const SizedBox(
  //         width: 10,
  //       ),
  //       Text(
  //         text,
  //         style: GoogleFonts.sora(
  //           color: isDisabled
  //               ? colorScheme(context).outline
  //               : textColor ?? colorScheme(context).onSurface.withOpacity(0.6),
  //           fontWeight: fontWeight ?? FontWeight.w600,
  //           fontSize: textSize ?? 14,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
