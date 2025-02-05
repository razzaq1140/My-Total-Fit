import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/route/get_pages.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _formKey = GlobalKey<FormState>();

  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (_) => FocusNode());
    _controllers = List.generate(4, (_) => TextEditingController());

    // Request focus on the first text field when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    });

    // Add listeners to each focus node to rebuild the widget when focus changes
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {}); // Rebuilds the widget to reflect border color changes
      });
    }
  }

  @override
  void dispose() {
    _focusNodes.forEach((node) => node.dispose());
    _controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  bool _isOtpComplete() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color:
              _focusNodes[index].hasFocus || _controllers[index].text.isNotEmpty
                  ? colorScheme(context).onSurface
                  : colorScheme(context).outline,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        style: textTheme(context).headlineMedium?.copyWith(
              color: colorScheme(context).onSurface,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        cursorHeight: 18, // Set cursor height to a smaller value
        onChanged: (value) {
          if (value.isNotEmpty) {
            // Move focus to the next field only if this field has input and if it's the correct sequence
            if (index < _focusNodes.length - 1) {
              _focusNodes[index].unfocus();
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          } else {
            // Move focus to the previous field if the current field is cleared
            if (index > 0) {
              _focusNodes[index].unfocus();
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            }
          }
          setState(() {}); // Update border color based on input
        },
        onTap: () {
          // Prevent tapping on any field except the first empty one in sequence
          if (index > 0 && _controllers[index - 1].text.isEmpty) {
            _focusNodes[index].unfocus();
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Verification code',
                  style: textTheme(context).headlineMedium?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter code that we have sent to your number',
                  style: textTheme(context).titleSmall?.copyWith(
                        color: colorScheme(context).onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => _buildOtpBox(index)),
                ),
                const SizedBox(height: 80),
                SizedBox(
                  height: 45,
                  child: CustomButton(
                    textSize: 18,
                    color: _isOtpComplete()
                        ? colorScheme(context).primary
                        : colorScheme(context)
                            .outline, // Button is only enabled if OTP is complete
                    textColor: colorScheme(context).surface,
                    onTap: () {
                      if (_isOtpComplete()) {
                        context.pushNamed(AppRoute.createPasswordPage);
                      }
                    },
                    text: 'Verify',
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Didn’t receive the code?  ',
                      style: textTheme(context).titleSmall?.copyWith(
                            color:
                                colorScheme(context).onSurface.withOpacity(0.7),
                          ),
                      children: [
                        TextSpan(
                          text: 'Resend',
                          style: textTheme(context).titleSmall?.copyWith(
                                color: colorScheme(context).primary,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Resend OTP action
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
