import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/core/navigation/Routes.dart';
import 'package:to_do_list/core/style/AssetsManager.dart';
import 'package:to_do_list/core/style/ColorManager.dart';
import 'package:to_do_list/core/style/TextStyleManager.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.BrandPrimaryDefault,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.logoApp, width: 120, height: 120),
            const SizedBox(height: 24),


            Text(
              'TaskFlow',
              style: TextStyleManager.textStyleNeutralWhiteB26(context),
            ),
            const SizedBox(height: 12),

           
            const Text(
              'The best to do list application for you',
              style: TextStyle(fontSize: 16, color:ColorManager.NeutralWhite),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  width: 36,
                  height: 12,
                  decoration: BoxDecoration(
                    color: ColorManager.NeutralWhite,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(width: 8), 
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB0BEC5),  
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFFB0BEC5),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void routingtoOnboarding() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.pushReplacement(Routes.kOnboardingView);
    });
  }

  @override
  void initState() {
    routingtoOnboarding();
    super.initState();
  }
}