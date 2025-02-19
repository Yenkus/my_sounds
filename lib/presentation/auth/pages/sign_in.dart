import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sounds/common/widgets/app_bar/app_bar.dart';
import 'package:my_sounds/common/widgets/button/basic_app_button.dart';
import 'package:my_sounds/core/assets/app_vectors.dart';
import 'package:my_sounds/presentation/auth/pages/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signUpText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _register(),
            const SizedBox(height: 50),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            BasicAppButton(onPressed: () {}, title: "Log In"),
          ],
        ),
      ),
    );
  }

  Widget _register() {
    return const Text(
      "Register",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    );
  }
}

Widget _emailField(BuildContext context) {
  return _textfield(context, "Enter Email");
}

Widget _passwordField(BuildContext context) {
  return _textfield(context, "Password");
}

Widget _textfield(BuildContext context, String hintText) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );
}

Widget _signUpText(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't Have An Account? ",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Signup()));
          },
          child: const Text("Sign Up"),
        ),
      ],
    ),
  );
}
