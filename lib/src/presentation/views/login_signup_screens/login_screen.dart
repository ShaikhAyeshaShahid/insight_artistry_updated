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
  TextEditingController loginController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          // Your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: SizeConfig.height(context, 0.2),
              width: SizeConfig.width(context, 0.8),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context, 0.04),
                  vertical: SizeConfig.height(context, 0.01)),
              child: HeadingTextWidget(
                text: "Login to Insight Artistry",
                fontSize: SizeConfig.height(context, 0.03),
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.person, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black54),
                suffixIcon: Icon(Icons.visibility, color: Colors.black54),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Don't have an account? ",
              style: TextStyle(color: Colors.black54),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'SignUp',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    )
        /*Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(context, 0.02),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildVerticalDivider(context, 0.02),
            Container(
              height: SizeConfig.height(context, 0.2),
              width: SizeConfig.width(context, 0.8),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width(context, 0.04),
                  vertical: SizeConfig.height(context, 0.04)),
              child: HeadingTextWidget(
                text: "Login to Insight Artistry",
                fontSize: SizeConfig.height(context, 0.03),
              ),
            ),
            TextFieldWidget(
              textEditingController: loginController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              color: Colors.yellow,
              icon: true,
              prefixIcon: Icon(Icons.person_2_outlined),
              isSuffixIcon: false,
              readOnly: false,
            ),
            buildVerticalDivider(context, 0.04),
            TextFieldWidget(
              textEditingController: loginController,
              textInputType: TextInputType.emailAddress,
              obscureText: false,
              color: Colors.yellow,
              icon: true,
              prefixIcon: Icon(Icons.password),
              isSuffixIcon: true,
              readOnly: false,
            ),
            buildVerticalDivider(context, 0.02),
            Align(
                alignment: Alignment.centerRight,
                child: SubHeadingTextWidget(
                  text: "Forgot password?",
                  fontSize: SizeConfig.width(context, 0.04),
                )),
            buildVerticalDivider(context, 0.04),
            ButtonWidget(
                marginWidth: SizeConfig.width(context, 0.07),
                onTab: () {
                  Navigator.pushNamed(context, AppRoute.loginScreen);
                },
                text: "Login"),
            buildVerticalDivider(context, 0.04),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: GlobalColor.textColor),
                  ),
                  TextSpan(
                    text: 'SignUp',
                    style: TextStyle(
                      color: GlobalColor.headTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),*/
        );
  }
}
