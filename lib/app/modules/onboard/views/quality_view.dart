import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class QualityView extends GetView {
  const QualityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4,
          width: double.infinity,
          child: Image.asset(
            'lib/app/data/images/quality.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.red.shade50, Colors.white])),
            child: Scaffold(
              backgroundColor: Colors.blueGrey.shade50,
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Wide Range of Products',
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
                              'Browse through various categories.',
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
                              'Choose from top brands and best qualities.',
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
