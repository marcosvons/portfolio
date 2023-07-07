import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/core.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
      ),
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.secondary,
                    context.colorScheme.primary,
                  ],
                ),
              ),
              height: context.height * 0.875,
              width: context.width,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: context.height * 0.1,
              width: context.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.secondary,
                    context.colorScheme.primary,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.xxLarge),
                child: Row(
                  children: [
                    SizedBox(
                      width: context.width * 0.2,
                      child: Lottie.asset(Animations.hi),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: context.width * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => scrollController.animateTo(
                              context.height * 1.1,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeIn,
                            ),
                            child: Text(
                              'About',
                              style: context.textTheme.displaySmall!.copyWith(
                                fontFamily: Fonts.belanosima,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => scrollController.animateTo(
                              context.height * 2.25,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeIn,
                            ),
                            child: Text(
                              'Portfolio',
                              style: context.textTheme.displaySmall!.copyWith(
                                fontFamily: Fonts.belanosima,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => scrollController.animateTo(
                              context.height * 3.3,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeIn,
                            ),
                            child: Text(
                              'Contact',
                              style: context.textTheme.displaySmall!.copyWith(
                                fontFamily: Fonts.belanosima,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: context.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Welcome!\n\n',
                          style: context.textTheme.displayLarge!.copyWith(
                            color: context.colorScheme.onBackground,
                            fontFamily: Fonts.caprasimo,
                            letterSpacing: 8,
                          ),
                          children: [
                            TextSpan(
                              text: "I'm ",
                              style: context.textTheme.displayLarge!.copyWith(
                                color: context.colorScheme.onBackground,
                                fontFamily: Fonts.belanosima,
                              ),
                            ),
                            WidgetSpan(
                              child: GradientText(
                                'Marcos',
                                style: context.textTheme.displayLarge!.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: context.colorScheme.tertiary,
                                  fontFamily: Fonts.belanosima,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    context.colorScheme.tertiary,
                                    context.colorScheme.primary,
                                  ],
                                ),
                              ),
                            ),
                            TextSpan(
                              text: ', a ',
                              style: context.textTheme.displayLarge!.copyWith(
                                color: context.colorScheme.onBackground,
                                fontFamily: Fonts.belanosima,
                              ),
                            ),
                            WidgetSpan(
                              child: GradientText(
                                'Flutter Developer',
                                style: context.textTheme.displayLarge!.copyWith(
                                  color: context.colorScheme.secondary,
                                  fontFamily: Fonts.belanosima,
                                  fontWeight: FontWeight.w800,
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    context.colorScheme.tertiary,
                                    context.colorScheme.primary,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimens.xxLarge * 1.5),
                      SizedBox(
                        width: context.width * 0.4,
                        height: context.height * 0.225,
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              Strings.introductionSubtitle,
                              textStyle:
                                  context.textTheme.displaySmall!.copyWith(
                                color: context.colorScheme.onBackground,
                                fontWeight: FontWeight.w500,
                                fontFamily: Fonts.narnoor,
                              ),
                              speed: const Duration(milliseconds: 20),
                            ),
                          ],
                          stopPauseOnTap: true,
                        ),
                      ),
                      const SizedBox(height: Dimens.xxLarge),
                      SizedBox(
                        width: context.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedButton(
                              initialColor: context.colorScheme.primary,
                              hoversColor: [
                                context.colorScheme.tertiary,
                                const Color(0xFF7BF4E8),
                              ],
                              onPressed: () {
                                launchURL(Strings.enCvUrl, context,
                                    errorMessage:
                                        'An error occurred while downloading the CV.');
                                launchURL(Strings.esCvUrl, context,
                                    errorMessage:
                                        'An error occurred while downloading the CV.');
                              },
                              duration: const Duration(milliseconds: 250),
                              child: Text(
                                'CV',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fonts.narnoor,
                                ),
                              ),
                            ),
                            AnimatedButton(
                              initialColor: context.colorScheme.primary,
                              hoversColor: [
                                context.colorScheme.tertiary,
                                const Color(0xFF7BF4E8),
                              ],
                              child: Text(
                                'Contact me',
                                style: context.textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Fonts.narnoor,
                                ),
                              ),
                              onPressed: () => scrollController.animateTo(
                                context.height * 3.3,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeIn,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.height * 0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: context.colorScheme.background,
                        radius: 200,
                        child: const CircleAvatar(
                          radius: 195,
                          backgroundImage: AssetImage(Images.profile),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ClipOval(
                        child: Container(
                          width: 300,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 30,
                                spreadRadius: -25,
                              ),
                            ],
                          ),
                        ),
                      ), // Adjust the gap between the shadow and other content
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
