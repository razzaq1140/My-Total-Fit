import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/global_veriable.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  bool isTapped = false;
  bool _isPasswordVisible = false; // New boolean for password visibility

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
                'Login',
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Text(
                'Login to Your Account to Continue your health Records',
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                hint: 'Email here email',
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.messageIcon,
                  ),
                ),
                validator: (value) => Validation.emailValidation(value),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hint: 'Enter here password',
                prefixIcon: Transform.scale(
                  scale: 0.6,
                  child: SvgPicture.asset(
                    AppIcons.lockIcon,
                  ),
                ),
                validator: (value) => Validation.passwordValidation(value),
                obscureText: !_isPasswordVisible, // Use the boolean here
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isPasswordVisible =
                          !_isPasswordVisible; // Toggle visibility
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
              const SizedBox(height: 5),
              InkWell(
                onTap: () => context.pushNamed(AppRoute.forgetPasswordPage),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Forgot Password?',
                    style: textTheme(context).titleSmall?.copyWith(
                        color: colorScheme(context).primary,
                        decorationColor: colorScheme(context).primary,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              SizedBox(height: height * 0.06),
              SizedBox(
                height: 45,
                child: CustomButton(
                  textSize: 18,
                  color: colorScheme(context).primary,
                  textColor: colorScheme(context).surface,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      MyAppRouter.clearAndNavigate(context, AppRoute.bottomNav);
                      setState(() {
                        isTapped = !isTapped; // Toggle the isTapped state
                      });
                    }
                  },
                  text: 'Login',
                ),
              ),
              SizedBox(height: height * 0.08),
              InkWell(
                onTap: () => context.pushNamed(AppRoute.signUpPage),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Do not have an Account lets ',
                      style: textTheme(context).titleSmall?.copyWith(
                          color:
                              colorScheme(context).onSurface.withOpacity(0.7)),
                      children: [
                        TextSpan(
                            text: 'Sign up',
                            style: textTheme(context).titleSmall?.copyWith(
                                color: colorScheme(context).primary,
                                decorationColor: colorScheme(context).primary,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
