import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoppy/app/modules/onboard/views/prices_view.dart';
import 'package:shoppy/app/modules/onboard/views/quality_view.dart';
import 'package:shoppy/app/modules/onboard/views/security_view.dart';
import 'package:shoppy/app/modules/onboard/views/welcome_view.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      controller: controller.pageController,
      children: const [   //onboarding proccess starts with welcome page and shows three features of the app
        WelcomeView(),
        SecurityView(),
        QualityView(),
        PricesView()
      ],
    );
  }
}
