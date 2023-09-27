import 'package:akademiklink/shared/shared_methods.dart';
import 'package:akademiklink/shared/theme.dart';
import 'package:akademiklink/ui/widgets/buttons.dart';
import 'package:akademiklink/ui/widgets/forms.dart';
import 'package:akademiklink/ui/widgets/login_choose.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final firstNameController = TextEditingController(text: '');
  final lastNameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isValidate() {
    if (emailController.text.isEmpty ||
        firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/signup.webp',
                width: 220,
              ),
              Text(
                "Create \nan Account!",
                style: blackTextStyle.copyWith(
                  fontSize: 34,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 46,
              ),
              CustomFormField(
                title: 'First Name',
                isShowTitle: false,
                controller: firstNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                title: 'Last Name',
                isShowTitle: false,
                controller: lastNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                title: 'Email',
                isShowTitle: false,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                title: 'Password',
                isShowTitle: false,
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomFilledButton(
                title: 'Sign up',
                onPressed: () {
                  if (isValidate()) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepage', (route) => false);
                  } else {
                    showCustomSnackbar(context, 'Semua field harus diisi');
                  }
                },
                bgColor: secondaryColor,
                textColor: whiteColor,
              ),
              const SizedBox(
                height: 26,
              ),
              Text("or", style: blackTextStyle),
              const SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginChoose(
                    imagePath: 'assets/fb.webp',
                    onTap: () {},
                  ),
                  LoginChoose(
                    imagePath: 'assets/google.webp',
                    onTap: () {},
                  ),
                  LoginChoose(
                    imagePath: 'assets/apple.webp',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
