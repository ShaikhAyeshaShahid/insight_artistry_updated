import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insight_artistry_updated/constant/colors.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../constant/divider.dart';
import '../../../../constant/size_config.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/heading.dart';
import '../../../../core/widgets/sub_heading.dart';
import '../../../../core/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
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
                SizedBox(
                  height: SizeConfig.height(context, 0.2),
                  width: SizeConfig.width(context, 0.8),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: SizeConfig.height(context, 0.02)),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.width(context, 0.04),
                      vertical: SizeConfig.height(context, 0.01)),
                  child: HeadingTextWidget(
                    text: "Login to Insight Artistry",
                    fontSize: SizeConfig.height(context, 0.03),
                    color: GlobalColor.head2TextColor,
                  ),
                ),
                buildVerticalDivider(context, 0.04),
                TextFieldWidget(
                  textEditingController: emailController,
                  textInputType: TextInputType.emailAddress,
                  obscureText: false,
                  icon: true,
                  prefixIcon: Icon(Icons.person, color: GlobalColor.head2TextColor),
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
                  prefixIcon: Icon(Icons.lock, color: GlobalColor.head2TextColor),
                  suffixIcon: Icon(Icons.visibility, color: GlobalColor.head2TextColor),
                  isSuffixIcon: true,
                  readOnly: false,
                  hint: "Password",
                ),
                buildVerticalDivider(context, 0.02),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: SizeConfig.width(context, 0.04)),
                  ),
                ),
                buildVerticalDivider(context, 0.05),
                ButtonWidget(
                    marginWidth: SizeConfig.width(context, 0.15),
                    onTab: () {
                      Navigator.pushNamed(context, AppRoute.homeScreen);
                    },
                    text: "Login"),
                buildVerticalDivider(context, 0.02),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: SizeConfig.width(context, 0.04),
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: GlobalColor.textColor,
                          fontSize: SizeConfig.width(context, 0.04),
                        ),
                      ),
                      TextSpan(
                        text: 'SignUp',
                        style: TextStyle(
                            color: GlobalColor.headTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.width(context, 0.04)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoute.signUpScreen);
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
