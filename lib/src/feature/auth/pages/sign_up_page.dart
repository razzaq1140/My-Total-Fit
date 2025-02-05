import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

import '../../../common/constents/app_images.dart';
import '../../../common/global_veriable.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Track visibility state
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign Up',
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                'Create Account to Continue your Fitness\n Records',
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                validator: (value) => Validation.fieldValidation(value, 'name'),
                hint: 'Enter here name',
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.personIcon,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: 'Enter here email',
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.messageIcon,
                  ),
                ),
                validator: (value) =>
                    Validation.fieldValidation(value, 'email'),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: 'Enter here password',
                controller: passwordController,
                validator: (value) => Validation.passwordValidation(value),
                obscureText: !_isPasswordVisible,
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.lockIcon,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined // Show password icon
                        : Icons.visibility_off_outlined,
                    color: AppColors.appGrey, // Hide password icon
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: 'Confirm Password',
                controller: confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.lockIcon,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                  child: Icon(
                    _isConfirmPasswordVisible
                        ? Icons
                            .visibility_outlined // Show confirm password icon
                        : Icons.visibility_off_outlined,
                    color: AppColors.appGrey, // Hide confirm password icon
                  ),
                ),
                validator: (value) => Validation.confirmPassword(
                    value, passwordController.text), // Compare with password
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 40),
              SizedBox(
                height: 45,
                child: CustomButton(
                  textSize: 18,
                  color: colorScheme(context).primary,
                  textColor: colorScheme(context).surface,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      MyAppRouter.clearAndNavigate(context, AppRoute.bottomNav);
                    }
                  },
                  text: 'Continue',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
