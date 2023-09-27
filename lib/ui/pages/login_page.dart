import 'package:akademiklink/shared/shared_methods.dart';
import 'package:akademiklink/shared/theme.dart';
import 'package:akademiklink/ui/pages/sign_up_page.dart';
import 'package:akademiklink/ui/widgets/buttons.dart';
import 'package:akademiklink/ui/widgets/forms.dart';
import 'package:akademiklink/ui/widgets/login_choose.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool isValidate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    emailController.dispose();
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
                'assets/login.webp',
                width: 200,
              ),
              Text(
                "Welcome back!",
                style: blackTextStyle.copyWith(
                  fontSize: 34,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomFormField(
                title: 'Email',
                isShowTitle: false,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                title: 'Password',
                isShowTitle: false,
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomFilledButton(
                title: 'Login',
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
                height: 26,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: blackTextStyle.copyWith(fontSize: 18),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            showDragHandle: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) => const SignUpPage(),
                          );
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
