import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import '../../../common/constents/app_images.dart';
import '../../../common/global_veriable.dart';
import '../../../common/widgets/custom_button.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forget Password',
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter your email or your phone number, we will send you a confirmation code',
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              // TabBar for Email and Phone
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: colorScheme(context).onSurface.withOpacity(0.2),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3.0, vertical: 2),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: colorScheme(context).primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelColor: colorScheme(context).surface,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('Email'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text('Phone'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // TabBarView to switch between Email and Phone input
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Email input
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            hint: 'jamesschleifer@gmail.com',
                            hintColor: colorScheme(context).primary,
                            prefixIcon: Transform.scale(
                              scale: 0.6,
                              child: SvgPicture.asset(
                                AppIcons.messageIcon,
                                color: colorScheme(context).primary,
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.done,
                              color: colorScheme(context).primary,
                            ),
                            textStyle: TextStyle(
                              color: colorScheme(context).primary,
                            ),
                            controller: _emailController,
                            validator:
                                Validation.emailValidation, // Email validation
                          ),
                          const SizedBox(height: 80),
                          SizedBox(
                            height: 45,
                            child: CustomButton(
                              textSize: 18,
                              color: colorScheme(context).primary,
                              textColor: colorScheme(context).surface,
                              onTap: () {
                                // Trigger validation on form submit
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  // Call function to handle reset password
                                  _sendConfirmationCode();
                                  context
                                      .pushNamed(AppRoute.verificationCodePage);
                                }
                              },
                              text: 'Reset Password',
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Phone input
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                            hint: '+92300000000',
                            hintColor: colorScheme(context).primary,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: colorScheme(context).primary,
                            ),
                            textStyle: TextStyle(
                              color: colorScheme(context).primary,
                            ),
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9+]')),
                            ],
                            validator: Validation
                                .phoneNumberValidation, // Phone validation
                          ),
                          const SizedBox(height: 80),
                          SizedBox(
                            height: 45,
                            child: CustomButton(
                              textSize: 18,
                              color: colorScheme(context).primary,
                              textColor: colorScheme(context).surface,
                              onTap: () {
                                // Trigger validation on form submit
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  // Call function to handle reset password
                                  _sendConfirmationCode();
                                  context
                                      .pushNamed(AppRoute.verificationCodePage);
                                }
                              },
                              text: 'Reset Password',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendConfirmationCode() {
    if (_tabController?.index == 0) {
      print("Send code to email: ${_emailController.text}");
    } else {
      print("Send code to phone: ${_phoneController.text}");
    }
  }
}
