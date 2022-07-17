import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tulang_cf/app/data/models/user_model.dart';
import 'package:lottie/lottie.dart';

import '../../../cores/core_colors.dart';
import '../../../cores/core_constants.dart';
import '../../../cores/core_images.dart';
import '../../../cores/core_strings.dart';
import '../../../cores/core_styles.dart';
import '../../../cores/helper/keyboard.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  final AuthController authController = Get.put(AuthController());
  final containerRadius = const Radius.circular(30.0);
  final _formKey = GlobalKey<FormState>();
  final _formRegisKey = GlobalKey<FormState>();
  final _userEmail = TextEditingController();
  final _userPass = TextEditingController();

  final _userName = TextEditingController();
  final _userAddress = TextEditingController();
  final _userPhone = TextEditingController();
  final _userPekerjaan = TextEditingController();

  String? validatePass(value) {
    if (value.isEmpty) {
      return kPassNullError;
    } else if (value.length < 8) {
      return kShortPassError;
    } else {
      return null;
    }
  }

  String? validateField(value) {
    if (value.isEmpty) {
      return kFieldNullError;
    } else {
      return null;
    }
  }

  String? validateEmail(value) {
    if (value.isEmpty) {
      return kEmailNullError;
    } else if (!emailValidatorRegExp.hasMatch(value)) {
      return kInvalidEmailError;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreColor.primary,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(CoreImages.doctorJson,
                          height:
                              MediaQuery.of(context).size.height * 0.2 - 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Obx(() => authController.count.value == 0
              ? login(context)
              : regis(context)),
        ],
      ),
    );
  }

  regis(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: containerRadius, topRight: containerRadius)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: containerRadius, topRight: containerRadius)),
        child: Form(
          key: _formRegisKey,
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: (28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: (16)),
                  emailField(_userName, validateField, TextInputType.text,
                      'Nama', Icons.person_pin),
                  SizedBox(height: (8)),
                  emailField(_userPhone, validateField, TextInputType.phone,
                      'Nomor Hp', Icons.phone_android_rounded),
                  SizedBox(height: (8)),
                  emailField(_userAddress, validateField, TextInputType.text,
                      'Alamat', Icons.home_rounded),
                  SizedBox(height: (8)),
                  emailField(_userPekerjaan, validateField, TextInputType.text,
                      'Pekerjaan', Icons.home_repair_service_rounded),
                  SizedBox(height: (8)),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1960),
                        lastDate: DateTime(DateTime.now().year + 1),
                      ).then((date) => authController.selectedDate.value =
                          date.toString().split(' ')[0]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(color: CoreColor.kHintTextColor),
                          borderRadius: BorderRadius.circular(8)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              color: CoreColor.primary,
                            ),
                            SizedBox(width: 8),
                            Obx(() => Text(
                                  authController.selectedDate.value,
                                  style: CoreStyles.uSubTitle.copyWith(
                                      color: Colors.black, fontSize: 15),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: (16)),
                  emailField(
                      _userEmail,
                      validateEmail,
                      TextInputType.emailAddress,
                      'Email',
                      Icons.alternate_email_rounded),
                  SizedBox(height: (8)),
                  passwordField(),
                  SizedBox(height: (36)),
                  GestureDetector(
                    onTap: () async {
                      if (_formRegisKey.currentState!.validate()) {
                        _formRegisKey.currentState!.save();

                        var email = _userEmail.text.trim();
                        var username = _userName.text.trim();
                        var phone = _userPhone.text.trim();
                        var address = _userAddress.text.trim();
                        var pekerjaan = _userPekerjaan.text.trim();
                        var password = _userPass.text.trim();

                        print(
                            '$email, $username, $phone, $address, $pekerjaan, $password');
                        await authController.userDaftar(
                            UserModel(
                                email: email,
                                name: username,
                                phone: phone,
                                address: address,
                                pekerjaan: pekerjaan),
                            password);
                        KeyboardUtil.hideKeyboard(context);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: CoreColor.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Obx(
                        () => authController.status.value == Status.running
                            ? loading()
                            : Text(
                                "Register",
                                style: CoreStyles.uTitle
                                    .copyWith(color: Colors.white),
                              ),
                      )),
                    ),
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                        text: 'sudah punya akun ?',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Masuk sekarang',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                  authController.count.value = 0;
                                })
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  login(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: containerRadius, topRight: containerRadius)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: containerRadius, topRight: containerRadius)),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: (28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your Phone and password  \nto continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: (26)),
                  emailField(
                      _userEmail,
                      validateEmail,
                      TextInputType.emailAddress,
                      'Email',
                      Icons.alternate_email_rounded),
                  SizedBox(height: (16)),
                  passwordField(),
                  SizedBox(height: (36)),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        var email = _userEmail.text.trim();
                        var password = _userPass.text.trim();

                        print(email);
                        await authController.loginUser(email, password);
                        KeyboardUtil.hideKeyboard(context);
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: CoreColor.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Obx(
                        () => authController.status.value == Status.running
                            ? loading()
                            : Text(
                                "Login",
                                style: CoreStyles.uTitle
                                    .copyWith(color: Colors.white),
                              ),
                      )),
                    ),
                  ),
                  SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                        text: 'belum punya akun ?',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Daftar sekarang',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                  authController.count.value = 1;
                                })
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  loading() {
    return CircularProgressIndicator(color: Colors.white);
  }

  TextFormField emailField(
      TextEditingController controller,
      String? Function(String?) validator,
      TextInputType inputType,
      String title,
      IconData icon) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: CoreColor.primary,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(color: Colors.black),

        hintText: 'Enter your $title',
        // Here is key idea

        prefixIcon: Icon(icon, color: CoreColor.primary),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CoreColor.primary, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: CoreColor.primaryExtraSoft,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: CoreColor.kHintTextColor,
            width: 1,
          ),
        ),
      ),
    );
  }

  passwordField() {
    return Obx(() => TextFormField(
          controller: _userPass,
          validator: validatePass,
          cursorColor: CoreColor.primary,
          keyboardType: TextInputType.text,
          obscureText: !authController
              .passwordVisible.value, //This will obscure text dynamically
          decoration: InputDecoration(
            labelText: 'Password',
            labelStyle: const TextStyle(color: Colors.black),

            hintText: 'Enter your password',
            // Here is key idea
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                authController.passwordVisible.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: CoreColor.primary,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable

                authController.passwordVisible.value =
                    !authController.passwordVisible.value;
              },
            ),

            prefixIcon:
                Icon(Icons.lock_outline_rounded, color: CoreColor.primary),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: CoreColor.primary, width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CoreColor.primaryExtraSoft,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: CoreColor.kHintTextColor,
                width: 1,
              ),
            ),
          ),
        ));
  }
}
