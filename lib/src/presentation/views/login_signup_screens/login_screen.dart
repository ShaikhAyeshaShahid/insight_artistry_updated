import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_artistry_updated/constant/colors.dart';
import 'package:insight_artistry_updated/src/presentation/cubit/login/login_cubit.dart';

import '../../../../app/routes/app_route.dart';
import '../../../../constant/divider.dart';
import '../../../../constant/size_config.dart';
import '../../../../core/widgets/button.dart';
import '../../../../core/widgets/heading.dart';
import '../../../../core/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Animation<double> logoFadeAnimation;
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  late LoginCubit loginCubit;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    loginCubit = BlocProvider.of<LoginCubit>(context);
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    logoFadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    slideAnimation = Tween(begin: const Offset(-1, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.ease));
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
            child: Form(
              key: _formKey,
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
                            prefixIcon:
                                Icon(Icons.person, color: GlobalColor.head2TextColor),
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
                            prefixIcon:
                                Icon(Icons.lock, color: GlobalColor.head2TextColor),
                            suffixIcon: Icon(Icons.visibility,
                                color: GlobalColor.head2TextColor),
                            isSuffixIcon: true,
                            readOnly: false,
                            hint: "Password",
                          ),
                        ],
                      ),
                    ),
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
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      print("State $state");
                      if (state is LoginSuccess) {
                        // loginCubit.login()
                        Navigator.pushNamed(context, AppRoute.homeScreen);
                      }
                      print("State $state");

                      if(state is LoginFailed)
                        {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                  state.errorMessage),
                            ),
                          );
                        }
                      print("State $state");

                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ButtonWidget(
                          marginWidth: SizeConfig.width(context, 0.15),
                          onTab: () {
                            print("State $state");

                            if (_formKey.currentState!.validate()) {
                              final email = emailController.text;
                              final password = passwordController.text;
                             /* loginCubit.login(
                                email: email,
                                password: password,
                              );*/

                              Navigator.pushNamed(
                                    context, AppRoute.homeScreen);
                            } // Navigator.pushNamed(context, AppRoute.homeScreen);
                          },
                          text: "Login");
                    },
                  ),
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
                              Navigator.pushNamed(
                                  context, AppRoute.signUpScreen);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
