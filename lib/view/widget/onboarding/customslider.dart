import 'package:ecommerce/controller/onboarding-controller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomSliderOnBoarder extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onboardingList.length,
      itemBuilder:
          (context, i) => Column(
            children: [
              Image.asset(
                onboardingList[i].image!,
                // width: 200,
                // height: 230,
                // fit: BoxFit.fill,
              ),
              const SizedBox(height: 60),
              Text(
                onboardingList[i].title!,

                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onboardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
    );
  }
}
