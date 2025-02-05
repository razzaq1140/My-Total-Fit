import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_total_fit/src/common/constents/app_colors.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/common/widgets/custom_textField.dart';
import 'package:my_total_fit/src/feature/profile/model/profile_model.dart';

class SettingPage extends StatefulWidget {
  final User user;
  const SettingPage({super.key, required this.user});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  String _selectedGender = "Male";
  // bool _isGenderError = false;

  // void _validateGender() {
  //   setState(() {
  //     _isGenderError = _selectedGender == null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        centerTitle: false,
        title: Text(
          "Setting",
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 280,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.bgpart),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(widget.user.imageUrl),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.user.username,
                      style: textTheme(context).headlineLarge?.copyWith(
                            color: colorScheme(context).surface,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text(
                      widget.user.email,
                      style: textTheme(context).headlineLarge?.copyWith(
                            color: colorScheme(context).surface,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _nameController,
                      borderColor: colorScheme(context).outlineVariant,
                      hint: "Enter your name",
                      hintColor: colorScheme(context).outline,
                      hintSize: 14,
                      prefixIcon: Transform.scale(
                        scale: 0.6,
                        child: SvgPicture.asset(
                          AppIcons.messageIcon,
                        ),
                      ),
                      validator: (value) =>
                          Validation.fieldValidation(value, "name"),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () async {
                        final String? selectedGender = await showDialog<String>(
                          context: context,
                          builder: (BuildContext context) {
                            return GenderSelectionDialog();
                          },
                        );
                        if (selectedGender != null) {
                          setState(() {
                            _selectedGender = selectedGender;
                          });
                        }
                      },
                      child: AbsorbPointer(
                        child: CustomTextFormField(
                          controller: TextEditingController(
                              text: _selectedGender ?? ""),
                          borderColor: colorScheme(context).outlineVariant,
                          hint: "Select gender",
                          hintColor: colorScheme(context)
                              .outline, // Set hint color to red if gender not selected
                          hintSize: 14,
                          prefixIcon: Transform.scale(
                            scale: 0.6,
                            child: SvgPicture.asset(
                              AppIcons.userIcon,
                            ),
                          ),
                          suffixIcon: const Icon(
                              Icons.arrow_drop_down), // Dropdown icon
                          errorText: _selectedGender == null
                              ? 'Please select a gender'
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomTextFormField(
                      fillColor: AppColors.appWhite,
                      controller: _weightController,
                      borderColor: colorScheme(context).outlineVariant,
                      hint: "Enter your weight",
                      hintColor: colorScheme(context).outline,
                      hintSize: 14,
                      prefixIcon: Transform.scale(
                        scale: 0.6,
                        child: SvgPicture.asset(
                          AppIcons.weightIcon,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) =>
                          Validation.numberValidation(value, field: "weight"),
                    ),
                    SizedBox(height: height * 0.07),
                    SizedBox(
                      height: 45,
                      child: CustomButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.pop();
                          }
                        },
                        color: colorScheme(context).primary,
                        textColor: colorScheme(context).surface,
                        textSize: 18,
                        borderRadius: 5,
                        text: "Update",
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
}

class GenderSelectionDialog extends StatelessWidget {
  final List<String> genderOptions = ["Male", "Female", "Other"];

  GenderSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Select Gender",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            ...genderOptions.map((gender) => ListTile(
                  title: Text(
                    gender,
                    style: const TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.of(context).pop(gender);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
