import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SecurityView extends GetView {
  const SecurityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          height: double.infinity,
          child: Image.asset(
            'lib/app/data/images/pay.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blueGrey.shade200, Colors.white])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Start Shopping Securely',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 36)),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.06),
                      AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Shop confidently with secure transactions.',
                              textStyle: TextStyle(
                                  color: Colors.red.shade700, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02),
                      AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TypewriterAnimatedText('Multiple payment options.',
                              textStyle: TextStyle(
                                  color: Colors.red.shade700, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02),
                      AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TypewriterAnimatedText('Track your order.',
                              textStyle: TextStyle(
                                  color: Colors.red.shade700, fontSize: 16))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.02),
                      AnimatedTextKit(
                        totalRepeatCount: 1,
                        animatedTexts: [
                          TypewriterAnimatedText(
                              'Be assured your data is safe.',
                              textStyle: TextStyle(
                                  color: Colors.red.shade700, fontSize: 16))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
