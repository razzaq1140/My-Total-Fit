import 'package:flutter/material.dart';

import '../../../common/global_veriable.dart';
import '../../../common/widgets/custom_button.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  // final _formKey = GlobalKey<FormState>();
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter Verification code',
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Enter code that we have sent to your number 08528188*** ',
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return _otpBox(index);
                }),
              ),
              const SizedBox(height: 50),
              CustomButton(
                  color: isTapped
                      ? colorScheme(context).primary
                      : colorScheme(context)
                          .outline, // Toggle color based on isTapped
                  onTap: () {
                    // Your form validation or any other logic here
                    setState(() {
                      isTapped = !isTapped; // Toggle the isTapped state
                    });
                  },
                  text: 'Login'),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Didn’t receive the code?  ',
                    style: textTheme(context).titleSmall?.copyWith(
                        color: colorScheme(context).onSurface.withOpacity(0.7)),
                    children: [
                      TextSpan(
                        text: 'Resend',
                        style: textTheme(context).titleSmall?.copyWith(
                              color: colorScheme(context).primary,
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox(int index) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: _otpControllers[index],
        focusNode: [_focusNode1, _focusNode2, _focusNode3, _focusNode4][index],
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).requestFocus(
                [_focusNode2, _focusNode3, _focusNode4, null][index]);
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).requestFocus(
                [_focusNode1, _focusNode2, _focusNode3][index - 1]);
          }
        },
      ),
    );
  }
}
