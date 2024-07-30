import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../constant/colors.dart';
import '../../../../constant/divider.dart';
import '../../../../constant/size_config.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/heading.dart';
import '../../../../core/widgets/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late Animation<double> logoFadeAnimation;
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    slideAnimation = Tween(begin: const Offset(-1, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    scaleAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.bgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width(context, 0.05),
              vertical: SizeConfig.height(context, 0.02)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: logoFadeAnimation,
                  child: SizedBox(
                    height: SizeConfig.height(context, 0.2),
                    width: SizeConfig.width(context, 0.8),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.height(context, 0.02)),
                SlideTransition(
                  position: slideAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.width(context, 0.04),
                              vertical: SizeConfig.height(context, 0.01)),
                          child: HeadingTextWidget(
                            text: "Create an Account",
                            fontSize: SizeConfig.height(context, 0.03),
                            color: GlobalColor.head2TextColor,
                          ),
                        ),
                        buildVerticalDivider(context, 0.04),
                        TextFieldWidget(
                          textEditingController: nameController,
                          textInputType: TextInputType.text,
                          obscureText: false,
                          icon: true,
                          prefixIcon: Icon(Icons.person,
                              color: GlobalColor.head2TextColor),
                          isSuffixIcon: false,
                          readOnly: false,
                          hint: "Name",
                        ),
                        buildVerticalDivider(context, 0.03),
                        TextFieldWidget(
                          textEditingController: emailController,
                          textInputType: TextInputType.emailAddress,
                          obscureText: false,
                          icon: true,
                          prefixIcon: Icon(Icons.mail,
                              color: GlobalColor.head2TextColor),
                          isSuffixIcon: false,
                          readOnly: false,
                          hint: "Email",
                        ),
                        buildVerticalDivider(context, 0.03),
                        TextFieldWidget(
                          textEditingController: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          icon: true,
                          prefixIcon: Icon(Icons.lock,
                              color: GlobalColor.head2TextColor),
                          suffixIcon: Icon(Icons.visibility,
                              color: GlobalColor.head2TextColor),
                          isSuffixIcon: true,
                          readOnly: false,
                          hint: "Password",
                        ),
                        buildVerticalDivider(context, 0.03),
                        TextFieldWidget(
                          textEditingController: confirmPasswordController,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          icon: true,
                          prefixIcon: Icon(Icons.lock,
                              color: GlobalColor.head2TextColor),
                          suffixIcon: Icon(Icons.visibility,
                              color: GlobalColor.head2TextColor),
                          isSuffixIcon: true,
                          readOnly: false,
                          hint: "Confirm Password",
                        ),
                      ],
                    ),
                  ),
                ),
                buildVerticalDivider(context, 0.05),
                ButtonWidget(
                    marginWidth: SizeConfig.width(context, 0.15),
                    onTab: () {
                      Navigator.pushNamed(context, AppRoute.loginScreen);
                    },
                    text: "Sign Up"),
                buildVerticalDivider(context, 0.02),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: SizeConfig.width(context, 0.04),
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          color: GlobalColor.textColor,
                          fontSize: SizeConfig.width(context, 0.04),
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: GlobalColor.headTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.width(context, 0.04),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoute.loginScreen);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
