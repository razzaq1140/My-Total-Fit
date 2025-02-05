import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

import '../../../common/global_veriable.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textField.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isTapped = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Password',
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Text(
                'Create a password to secure your account',
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                hint: 'Enter Password',
                controller: _passwordController,
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.lockIcon,
                  ),
                ),
                obscureText: !_isPasswordVisible,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible =
                          !_isPasswordVisible; // Toggle Enter Password visibility
                    });
                  },
                  child: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined // Show password icon
                        : Icons.visibility_off_outlined,
                    color: AppColors.appGrey, // Hide password icon
                  ),
                ),
                validator: (value) {
                  return Validation.passwordValidation(value);
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: 'Confirm Password',
                controller: _confirmPasswordController,
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.lockIcon,
                  ),
                ),
                obscureText: !_isConfirmPasswordVisible,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return Validation.passwordValidation(value);
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isConfirmPasswordVisible =
                          !_isConfirmPasswordVisible; // Toggle Confirm Password visibility
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
              ),
              SizedBox(height: height * 0.07),
              SizedBox(
                height: 45,
                child: CustomButton(
                  textSize: 18,
                  color: colorScheme(context).primary,
                  textColor: colorScheme(context).surface,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      MyAppRouter.clearAndNavigate(
                          context, AppRoute.signInPage);

                      setState(() {
                        isTapped = !isTapped; // Toggle the isTapped state
                      });
                    }
                  },
                  text: 'Create Password',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
