import 'package:flutter/material.dart';
import 'package:udemy/theme/screen_util.dart';

import '../screens/Home.dart';
import '../theme/theme_helper.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_form_field.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF5F9FF),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CustomImageView(
                          //   imagePath: ImageConstant.imgTelevision,
                          //   height: 70.adaptSize,
                          //   width: 70.adaptSize,
                          // ),

                          Image.asset("assets/LOGO.png",width: 186,height: 70,)

                        ],
                      ),
                    ),
                    SizedBox(height: 62),
                    Text(
                      "Let’s Sign In.!",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Login to Your Account to Continue your Courses",
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 48),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 7, 23),
                        child: Icon(Icons.email_outlined),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60,
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      prefix: Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 7, 23),
                        child: Icon(Icons.lock_outline),
                      ),
                      prefixConstraints: BoxConstraints(
                        maxHeight: 60,
                      ),
                      suffix: Container(
                        margin: EdgeInsets.fromLTRB(30, 21, 15, 21),
                        child:  Icon(Icons.remove_red_eye_outlined),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: 60,
                      ),
                      obscureText: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 21),
                    ),
                    SizedBox(height: 23),
                    _buildLoginOptions(context),
                    SizedBox(height: 36),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                        child: _buildSignInButton(context)),
                    SizedBox(height: 24),
                Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Don’t have an Account? ",
                                    style:
                                    CustomTextStyles.titleSmallff545454,
                                  ),
                                  TextSpan(
                                    text: "SIGN UP",
                                    style:
                                    CustomTextStyles.titleSmallff0961f5,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                    // SizedBox(height: 25.v),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       CustomIconButton(
                    //         height: 48.adaptSize,
                    //         width: 48.adaptSize,
                    //         padding: EdgeInsets.all(13.h),
                    //         child: CustomImageView(
                    //           imagePath: ImageConstant.imgCircle,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(left: 50.h),
                    //         child: CustomIconButton(
                    //           height: 48.adaptSize,
                    //           width: 48.adaptSize,
                    //           padding: EdgeInsets.all(14.h),
                    //           child: CustomImageView(
                    //             imagePath: ImageConstant.imgCircleGray900,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 50.v),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: SizedBox(
                    //     height: 18.v,
                    //     width: 221.h,
                    //     child: Stack(
                    //       alignment: Alignment.bottomRight,
                    //       children: [
                    //         Align(
                    //           alignment: Alignment.center,
                    //           child: RichText(
                    //             text: TextSpan(
                    //               children: [
                    //                 TextSpan(
                    //                   text: "Don’t have an Account? ",
                    //                   style:
                    //                   CustomTextStyles.titleSmallff545454,
                    //                 ),
                    //                 TextSpan(
                    //                   text: "SIGN UP",
                    //                   style:
                    //                   CustomTextStyles.titleSmallff0961f5,
                    //                 ),
                    //               ],
                    //             ),
                    //             textAlign: TextAlign.left,
                    //           ),
                    //         ),
                    //         Align(
                    //           alignment: Alignment.bottomRight,
                    //           child: SizedBox(
                    //             width: 57.h,
                    //             child: Divider(
                    //               endIndent: 1.h,
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1),
          child: CustomCheckboxButton(
            text: "Remember Me",
            value: rememberMe,
            padding: EdgeInsets.symmetric(vertical: 1),
            onChange: (value) {
              rememberMe = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2),
          child: Text(
            "Forgot Password?",
            style: theme.textTheme.labelLarge,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSignInButton(BuildContext context) {
    return Container(
      height: 55,
      width: 350,
      margin: EdgeInsets.only(left: 5),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: appTheme.blueA700,
                borderRadius: BorderRadius.circular(
                  30,
                ),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.black900.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(
                      1,
                      2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12,
                      bottom: 8,
                    ),
                    child: Text(
                      "Sign In",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 89.h),
                  //   child: CustomIconButton(
                  //     height: 48.adaptSize,
                  //     width: 48.adaptSize,
                  //     padding: EdgeInsets.all(13.h),
                  //     child: CustomImageView(
                  //       imagePath: ImageConstant.imgFill1,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                    ),
                    child:  Icon(
                      Icons.arrow_circle_right,
                      color: Colors.white, // Change the arrow color as needed
                      size: 50.0,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 89.h),
                  //   child: CustomIconButton(
                  //     height: 48.adaptSize,
                  //     width: 48.adaptSize,
                  //     padding: EdgeInsets.all(13.h),
                  //     child: CustomImageView(
                  //       imagePath: ImageConstant.imgFill1,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}