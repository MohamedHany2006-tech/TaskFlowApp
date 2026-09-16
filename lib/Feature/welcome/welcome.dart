import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_list/Feature/Onboarding/widgets/Custome_tab.dart';
import 'package:to_do_list/core/Share/widgets/cutome_main_btn.dart';
import 'package:to_do_list/core/Utilis/unints.dart';
import 'package:to_do_list/core/navigation/Routes.dart';
import 'package:to_do_list/core/style/AssetsManager.dart';
import 'package:to_do_list/core/style/ColorManager.dart';
import 'package:to_do_list/core/style/TextStyleManager.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: Units.getHeight(context: context, value: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome To ',
                    style: TextStyleManager.textStyleNeutralPrimaryB24(context),
                  ),
                  Text(
                    'Workspace',
                    style: TextStyleManager.textStyleBrandPrimaryDefaultB24(context),
                  ),
                ],
              ),
              
              const Spacer(),
              
              Custome_tab(
                image: AssetsManager.Welcome,
                title: '',
                description: '',
              ),
                    
              const Spacer(),
                    
              CutomeMainBtn(
                textColor: ColorManager.NeutralWhite,
                onPressed: () {
                  context.pushReplacement(Routes.kLogin);
                },
                btnTitle: 'Continue with Email',
                customeContent: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsManager.Mssage, width: 24, height: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Continue with Email',
                        style: TextStyleManager.textStyleNeutralWhiteM18(context),
                      ),
                    ],
                  ),
                ),
              ),             
              
              SizedBox(height: Units.getHeight(context: context, value: 12)),
              
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(color: ColorManager.NeutralLine, thickness: 1),
                  Container(
                    color: ColorManager.NeutralWhite,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'or continue with',
                      style: TextStyleManager.textStyleNeutralSecondaryR14(context),
                    ),
                  ),
                ],
              ),
            
              SizedBox(height: Units.getHeight(context: context, value: 12)),
              
           Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CutomeMainBtn(
                    width: 155.5,
                    height: 56,
                    btncolor: ColorManager.btn,
                    onPressed: () {},
                    btnTitle: 'Facebook',
                    customeContent: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsManager.Facebook,
                            width: Units.getWidth(
                              context: context,
                              value: 20,
                            ),
                            height: Units.getHeight(
                              context: context,
                              value: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Facebook',
                            style: TextStyleManager.textStyleNeutralPrimaryM16(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                    
                  SizedBox(
                    width: Units.getWidth(
                      context: context,
                      value: 16,
                    ),
                  ),
                    
                  CutomeMainBtn(
                    width: 155.5,
                    height: 56,
                    btncolor: ColorManager.btn,
                    onPressed: () {},
                    btnTitle: 'Google',
                    customeContent: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsManager.Google,
                            width: Units.getWidth(
                              context: context,
                              value: 20,
                            ),
                            height: Units.getHeight(
                              context: context,
                              value: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Google',
                            style: TextStyleManager.textStyleNeutralPrimaryM16(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: Units.getHeight(context: context, value: 20)),
            ],
          ),
        ),
      ),
    );
  }
}