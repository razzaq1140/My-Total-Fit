import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../global_veriable.dart';

class CustomTextFormField extends StatelessWidget {
  final int? maxline;
  final int? maxLength;
  final double? height;
  final double? hintSize;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final EdgeInsetsGeometry? contentPadding;
  final String? hint;
  final String? labelText;
  final String? initialValue;
  final bool? obscureText;
  final bool? filled;
  final bool? isCollapsed;
  final bool? isDense;
  final bool? isEnabled;
  final bool? readOnly;
  final Color? fillColor;
  final Color? hintColor;
  final Color? inputColor;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? cursorColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? textStyle;
  final TextStyle? errorTextStyle;
  final InputDecoration? customDecoration;
  final String? semanticLabel;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextAlign textAlign;
  final String? errorText;

  const CustomTextFormField({
    super.key,
    this.maxline,
    this.maxLength,
    this.height,
    this.hintSize,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.contentPadding,
    this.hint,
    this.labelText,
    this.initialValue,
    this.obscureText,
    this.filled = true,
    this.isCollapsed,
    this.isDense,
    this.isEnabled,
    this.readOnly,
    this.fillColor,
    this.hintColor,
    this.inputColor,
    this.borderColor,
    this.focusBorderColor,
    this.cursorColor,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.keyboardType,
    this.inputAction,
    this.autoValidateMode,
    this.textStyle,
    this.errorTextStyle,
    this.customDecoration,
    this.semanticLabel,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTapOutside,
    this.controller,
    this.validator,
    this.textAlign = TextAlign.start,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      controller: controller,
      focusNode: focusNode,
      maxLength: maxLength,
      obscureText: obscureText ?? false,
      cursorColor: cursorColor,
      maxLines: (obscureText ?? false) ? 1 : (maxline ?? 1),
      textInputAction: inputAction,
      initialValue: initialValue,
      style: textStyle ??
          textTheme(context).bodyMedium?.copyWith(
              color: colorScheme(context).onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w500),
      autofocus: false,
      keyboardType: keyboardType,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      autovalidateMode: autoValidateMode,
      readOnly: readOnly ?? false,
      enabled: isEnabled ?? true,
      decoration: customDecoration ??
          InputDecoration(
            labelText: labelText,
            labelStyle: textTheme(context)
                .titleSmall
                ?.copyWith(color: colorScheme(context).onSurface),
            counterText: '',
            hintText: hint,
            hintStyle: textTheme(context).bodyMedium?.copyWith(
                color: AppColors.gary,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            filled: filled ?? true,
            fillColor: fillColor ?? colorScheme(context).surface,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: horizontalPadding ?? 20.0,
                  vertical: verticalPadding ?? 16,
                ),
            errorText: errorText,
            errorStyle: errorTextStyle,
            errorMaxLines: 2,
            isCollapsed: isCollapsed ?? false,
            isDense: isDense,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ??
                    colorScheme(context).onSurface.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusBorderColor ?? colorScheme(context).onSurface,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme(context).onSurface.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme(context).onSurface.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme(context).onSurface.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: colorScheme(context).onSurface.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
          ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutside ??
          (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
    );
  }
}

class Validation {
  static String? fieldValidation(String? value, String field) {
    if (value!.isEmpty) {
      return 'Please enter $field';
    }
    return null;
  }

  static String? emailValidation(String? value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter';
    // }
    // if (!value.contains(RegExp(r'[a-z]'))) {
    //   return 'Password must contain at least one lowercase letter';
    // }
    // if (!value.contains(RegExp(r'[0-9]'))) {
    //   return 'Password must contain at least one digit';
    // }
    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'Password must contain at least one special character';
    // }
    return null;
  }

  static String? confirmPassword(String? value, String confirm) {
    if (value != confirm) {
      return 'Passwords do not match';
    } else if (passwordValidation(value) != null) {
      return passwordValidation(value);
    }
    return null;
  }

  static String? phoneNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    // Universal phone number format (+ followed by up to 15 digits)
    RegExp regex = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (!regex.hasMatch(value)) {
      return 'Invalid phone number format';
    }
    return null;
  }

  static String? cardNumberValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a card number';
    }
    RegExp regex = RegExp(r'^\d{4}\s\d{4}\s\d{4}\s\d{4}$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid card number';
    }
    return null;
  }

  static String? expiryDateValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an expiry date';
    }
    RegExp regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid expiry date';
    }
    return null;
  }

  static String? cvvValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the CVV';
    }
    RegExp regex = RegExp(r'^\d{3}$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid CVV';
    }
    return null;
  }

  static String? numberValidation(String? value, {String field = "number"}) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $field';
    }
    // Regular expression to check if the input is a valid number (integer or decimal)
    RegExp regex = RegExp(r'^\d+(\.\d+)?$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid $field (only digits or decimals allowed)';
    }
    return null;
  }
}
