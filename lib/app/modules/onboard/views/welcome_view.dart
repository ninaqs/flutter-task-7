import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WelcomeView extends GetView {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/app/data/images/img.png"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: (MediaQuery.of(context).size.height * 0.1)),
            Card(
              elevation: 0,
              color: const Color.fromARGB(186, 255, 255, 255),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TypewriterAnimatedText('WELCOME TO SHOPPY',
                            textAlign: TextAlign.center,
                            textStyle: const TextStyle(
                                fontSize: 48,
                                color: Color.fromARGB(255, 185, 12, 0)))
                      ],
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.05)),
                    AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
                      TypewriterAnimatedText(
                        'Your wishlist, just a tap away!',
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ]),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.05)),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Start Exploring',
                            style: TextStyle(
                                fontSize: 18, color: Colors.blueGrey)),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blueGrey,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
