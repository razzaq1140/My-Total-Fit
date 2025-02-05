import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAnimatedButton extends StatefulWidget {
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
  final bool isAnimated;

  const CustomAnimatedButton({
    super.key,
    required this.onTap,
    this.isAnimated = true,
    this.text = "Next",
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
  State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  double height = 50;
  double padding = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 50,
      width: widget.width ?? double.infinity,
      padding: EdgeInsets.all(padding),
      child: ElevatedButton(
        onPressed: widget.isDisabled
            ? null
            : widget.isAnimated
                ? () {
                    setState(() {
                      padding = 4;
                    });
                    Future.delayed(
                      const Duration(milliseconds: 150),
                      () {
                        padding = 0;
                        setState(() {});
                        Future.delayed(
                          const Duration(milliseconds: 150),
                          widget.onTap,
                        );
                      },
                    );
                  }
                : widget.onTap, // Disable the button when isDisabled is true
        style: ElevatedButton.styleFrom(
          // backgroundColor: colorScheme(context).primary,
          backgroundColor: widget.color ?? Colors.black,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(55),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 100),
            side: BorderSide(
              color: widget.borderColor ??
                  Colors.transparent, // Apply border color
              width: widget.borderWidth ?? 1.0, // Apply border width
            ),
            // side: BorderSide.none, // No border will be applied here
          ),

          elevation: widget.elevation ?? 0,
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.kantumruyPro(
            color: widget.textColor ?? Colors.white,
            fontWeight: widget.fontWeight ?? FontWeight.w600,
            fontSize: widget.textSize ?? (18 - padding + 1),
            letterSpacing: widget.letterSpacing ?? 0,
          ),
        ),
      ),
    );
  }
}
