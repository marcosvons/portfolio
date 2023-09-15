import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/core.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: const GlobalObjectKey('hero'),
      builder: (context, constraints) {
        return DecoratedBox(
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
              if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                const NavigationBar(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: constraints.maxWidth > Resolutions.mobileMaxWidth
                          ? context.width * 0.4
                          : context.width,
                      child: Column(
                        crossAxisAlignment:
                            constraints.maxWidth > Resolutions.mobileMaxWidth
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: constraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? TextAlign.start
                                : TextAlign.center,
                            text: TextSpan(
                              text: 'Welcome!\n\n',
                              style: context.textTheme.displayLarge!.copyWith(
                                color: context.colorScheme.onBackground,
                                fontFamily: Fonts.caprasimo,
                                letterSpacing: 8,
                              ),
                              children: [
                                if (constraints.maxWidth <
                                    Resolutions.mobileMaxWidth)
                                  WidgetSpan(
                                    child: Center(
                                      child: PhotoAvatar(
                                        constraints: constraints,
                                      ),
                                    ),
                                  ),
                                TextSpan(
                                  text: "I'm ",
                                  style:
                                      context.textTheme.displayLarge!.copyWith(
                                    color: context.colorScheme.onBackground,
                                    fontFamily: Fonts.belanosima,
                                  ),
                                ),
                                WidgetSpan(
                                  child: GradientText(
                                    'Marcos',
                                    style: context.textTheme.displayLarge!
                                        .copyWith(
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
                                  style:
                                      context.textTheme.displayLarge!.copyWith(
                                    color: context.colorScheme.onBackground,
                                    fontFamily: Fonts.belanosima,
                                  ),
                                ),
                                WidgetSpan(
                                  child: GradientText(
                                    'Flutter Developer',
                                    style: context.textTheme.displayLarge!
                                        .copyWith(
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
                          SizedBox(
                            height: constraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? Dimens.xxLarge * 1.5
                                : Dimens.large,
                          ),
                          SizedBox(
                            width: constraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? context.width * 0.4
                                : context.width * 0.85,
                            height: constraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? context.height * 0.225
                                : context.height * 0.275,
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  Strings.introductionSubtitle,
                                  textAlign: constraints.maxWidth >
                                          Resolutions.mobileMaxWidth
                                      ? TextAlign.start
                                      : TextAlign.center,
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
                            width: constraints.maxWidth >
                                    Resolutions.mobileMaxWidth
                                ? context.width * 0.4
                                : context.width,
                            child: Row(
                              mainAxisAlignment: constraints.maxWidth >
                                      Resolutions.mobileMaxWidth
                                  ? MainAxisAlignment.spaceBetween
                                  : MainAxisAlignment.spaceAround,
                              children: [
                                AnimatedButton(
                                  constraints: constraints,
                                  initialColor: context.colorScheme.primary,
                                  hoversColor: [
                                    context.colorScheme.tertiary,
                                    const Color(0xFF7BF4E8),
                                  ],
                                  onPressed: () {
                                    launchURL(
                                      Strings.enCvUrl,
                                      context,
                                      errorMessage:
                                          'An error occurred while downloading the CV.',
                                    );
                                    launchURL(
                                      Strings.esCvUrl,
                                      context,
                                      errorMessage:
                                          'An error occurred while downloading the CV.',
                                    );
                                  },
                                  duration: const Duration(milliseconds: 250),
                                  child: Text(
                                    'CV',
                                    style:
                                        context.textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: Fonts.narnoor,
                                    ),
                                  ),
                                ),
                                AnimatedButton(
                                  constraints: constraints,
                                  initialColor: context.colorScheme.primary,
                                  hoversColor: [
                                    context.colorScheme.tertiary,
                                    const Color(0xFF7BF4E8),
                                  ],
                                  child: Text(
                                    'Contact me',
                                    style:
                                        context.textTheme.bodyLarge!.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: Fonts.narnoor,
                                    ),
                                  ),
                                  onPressed: () => Scrollable.ensureVisible(
                                    const GlobalObjectKey('contact')
                                        .currentContext!,
                                    duration: const Duration(
                                      seconds: 1,
                                    ),
                                    alignment: .5,
                                    curve: Curves.easeInOutCubic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                      PhotoAvatar(
                        constraints: constraints,
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PhotoAvatar extends StatelessWidget {
  const PhotoAvatar({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: constraints.maxWidth > Resolutions.mobileMaxWidth
            ? context.height * 0.1
            : 0,
        bottom: constraints.maxWidth > Resolutions.mobileMaxWidth
            ? 0
            : Dimens.large,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: context.colorScheme.background,
            radius:
                constraints.maxWidth > Resolutions.mobileMaxWidth ? 200 : 125,
            child: CircleAvatar(
              radius:
                  constraints.maxWidth > Resolutions.mobileMaxWidth ? 195 : 130,
              backgroundImage: const AssetImage(Images.profile),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ClipOval(
            child: Container(
              width:
                  constraints.maxWidth > Resolutions.mobileMaxWidth ? 300 : 225,
              height:
                  constraints.maxWidth > Resolutions.mobileMaxWidth ? 100 : 25,
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
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                      onTap: () => Scrollable.ensureVisible(
                        const GlobalObjectKey('about').currentContext!,
                        duration: const Duration(
                          seconds: 1,
                        ),
                        alignment: .5,
                        curve: Curves.easeInOutCubic,
                      ),
                      child: Text(
                        'About',
                        style: context.textTheme.displaySmall!.copyWith(
                          fontFamily: Fonts.belanosima,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Scrollable.ensureVisible(
                        const GlobalObjectKey('portfolio').currentContext!,
                        duration: const Duration(
                          seconds: 1,
                        ),
                        alignment: .5,
                        curve: Curves.easeInOutCubic,
                      ),
                      child: Text(
                        'Portfolio',
                        style: context.textTheme.displaySmall!.copyWith(
                          fontFamily: Fonts.belanosima,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Scrollable.ensureVisible(
                        const GlobalObjectKey('contact').currentContext!,
                        duration: const Duration(
                          seconds: 1,
                        ),
                        alignment: .5,
                        curve: Curves.easeInOutCubic,
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
    );
  }
}
