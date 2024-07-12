import 'package:flutter/material.dart';
import 'package:flutter_movie_app/static/assets.dart';
import '../../../core/util/app_strings.dart';
import '../../../core/util/color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: _loginPage(context),
    );
  }

  SingleChildScrollView _loginPage(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                AppStrings.helloWelcome,
                style: TextStyle(
                  color: AppColors.font,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              const Text(
                AppStrings.loginToContinue,
                style: TextStyle(
                  color: AppColors.font,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.username,
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: AppColors.fieldColor,
                  labelStyle: const TextStyle(
                    color: AppColors.font,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                  hintStyle: const TextStyle(
                    color: AppColors.font,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.password,
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: AppColors.fieldColor,
                  labelStyle: const TextStyle(
                    color: AppColors.font,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                  ),
                  hintStyle: const TextStyle(
                    color: AppColors.font,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.font,
                      textStyle: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    child: const Text(AppStrings.forgotPassword)),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                  child: const Text(
                    AppStrings.login,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              const Text(
                AppStrings.orSignInWith,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        google,
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(AppStrings.loginWithGoogle)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        facebook,
                        height: 30,
                        width: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(AppStrings.loginWithFacebook)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.dontHaveAccount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: AppColors.font,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      AppStrings.signup,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
