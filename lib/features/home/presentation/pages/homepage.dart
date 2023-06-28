import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/core.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.xxLarge),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWeb = constraints.maxWidth > Resolutions.mobileMaxWidth;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height:
                          isWeb ? context.height * 0.3 : context.height * 0.3,
                      child: Lottie.asset(Animations.constructionSite),
                    ),
                    const SizedBox(
                      height: Dimens.xxLarge * 1.5,
                    ),
                    Text(
                      Strings.websiteUnderConstructionTitle,
                      style: context.textTheme.displayLarge,
                    ),
                    const SizedBox(height: Dimens.xxLarge * 1.5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.15),
                      child: Text(
                        Strings.websiteUnderConstruction,
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: Dimens.xxLarge * 1.5),
                    Text(
                      'Meanwhile...',
                      style: context.textTheme.displayLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: Dimens.xxLarge * 1.5),
                    if (isWeb)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: isWeb
                                ? context.width * 0.3
                                : context.width * 0.9,
                            height: isWeb
                                ? context.height * 0.1
                                : context.height * 0.2,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  context.colorScheme.onPrimary,
                                ),
                              ),
                              child: Text(
                                'Checkout my LinkedIn profile',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                js.context.callMethod(
                                  'open',
                                  [
                                    'https://www.linkedin.com/in/marcosvonstremayr'
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.3,
                            height: context.height * 0.1,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  context.colorScheme.onPrimary,
                                ),
                              ),
                              child: Text(
                                'Checkout my GitHub profile',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                js.context.callMethod(
                                  'open',
                                  ['https://github.com/marcosvons'],
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          SizedBox(
                            width: context.width * 0.9,
                            height: context.height * 0.15,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  context.colorScheme.onPrimary,
                                ),
                              ),
                              child: Text(
                                'Checkout my LinkedIn profile',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                js.context.callMethod(
                                  'open',
                                  [
                                    'https://www.linkedin.com/in/marcosvonstremayr'
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: Dimens.xxLarge * 1.5),
                          SizedBox(
                            width: context.width * 0.9,
                            height: context.height * 0.15,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  context.colorScheme.onPrimary,
                                ),
                              ),
                              child: Text(
                                'Checkout my GitHub profile',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                js.context.callMethod(
                                  'open',
                                  ['https://github.com/marcosvons'],
                                );
                              },
                            ),
                          ),
                        ],
                      )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
