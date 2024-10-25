import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_sounds/common/widgets/button/basic_app_button.dart';
import 'package:my_sounds/core/assets/app_images.dart';
import 'package:my_sounds/core/assets/app_vectors.dart';
import 'package:my_sounds/core/configs/theme/app_colors.dart';
import 'package:my_sounds/presentation/auth/pages/signup_or_signin.dart';
import 'package:my_sounds/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.chooseModeBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo)),
                const Spacer(),
                const Text(
                  'Choose Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _modeButton(
                            onTap: () {
                              context
                                  .read<ThemeCubit>()
                                  .updateTheme(ThemeMode.light);
                            },
                            label: 'Light Mode',
                            logo: AppVectors.sun),
                        const SizedBox(width: 40),
                        _modeButton(
                            onTap: () {
                              context
                                  .read<ThemeCubit>()
                                  .updateTheme(ThemeMode.dark);
                            },
                            label: 'Dark Mode',
                            logo: AppVectors.moon),
                      ]),
                ),
                const SizedBox(height: 50),
                BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignupOrSigninPage()));
                    },
                    title: 'Continue'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _modeButton(
      {required Function() onTap,
      required String label,
      required String logo}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: const Color(0xff30393C).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  logo,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
