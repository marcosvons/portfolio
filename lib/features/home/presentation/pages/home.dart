import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/home/home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: [
          Hero(
            scrollController: _scrollController,
          ),
          const About(),
          Container(
            height: context.height,
            width: context.width,
            color: context.colorScheme.background,
          ),
          Container(
            height: context.height,
            width: context.width,
            color: context.colorScheme.primary,
          ),
          Container(
            height: context.height,
            width: context.width,
            color: context.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      color: context.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.xxLarge,
          vertical: Dimens.large,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: context.width * 0.1,
                bottom: Dimens.xxLarge,
              ),
              child: GradientText(
                'About',
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary,
                    context.colorScheme.tertiary,
                  ],
                ),
                style: context.textTheme.displayLarge!.copyWith(
                  fontFamily: Fonts.belanosima,
                  fontSize: 80,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: context.width * 0.8,
                height: context.height * 0.75,
                child: const AboutPageView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPageView extends StatefulWidget {
  const AboutPageView({
    super.key,
  });

  @override
  State<AboutPageView> createState() => _AboutPageViewState();
}

class _AboutPageViewState extends State<AboutPageView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _pageController.previousPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: Dimens.xxLarge,
            color: context.colorScheme.tertiary,
          ),
        ),
        SizedBox(width: context.width * 0.1),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              const EducationPage(),
              const ExperiencePage(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.aboutConclusion,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontFamily: Fonts.narnoor,
                      fontSize: Dimens.large,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: context.width * 0.1),
        GestureDetector(
          onTap: () => _pageController.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          ),
          child: Icon(
            Icons.arrow_forward_ios,
            size: Dimens.xxLarge,
            color: context.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: Dimens.small,
              ),
              child: HoverAndRedirectContainer(
                url: 'https://www.witbor.com/',
                child: Container(
                  height: context.height * 0.2,
                  width: context.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Dimens.small),
                    ),
                    color: context.colorScheme.onBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.xSmall),
                    child: Image.asset(Images.witbor),
                  ),
                ),
              ),
            ),
            SizedBox(width: context.width * 0.05),
            Expanded(
              child: Text(
                Strings.witborExperience,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: Fonts.narnoor,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: Dimens.large),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Dimens.xSmall,
                horizontal: Dimens.small,
              ),
              child: HoverAndRedirectContainer(
                url: 'https://www.globant.com/',
                child: Container(
                  height: context.height * 0.2,
                  width: context.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Dimens.small),
                    ),
                    color: context.colorScheme.onBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.xSmall),
                    child: Image.asset(Images.globant),
                  ),
                ),
              ),
            ),
            SizedBox(width: context.width * 0.05),
            Expanded(
              child: Text(
                Strings.globantExperience,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: Fonts.narnoor,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: Dimens.large),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: Dimens.small,
              ),
              child: HoverAndRedirectContainer(
                url: 'https://www.urbetrack.com/',
                child: Container(
                  height: context.height * 0.2,
                  width: context.width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(Dimens.small),
                    ),
                    color: context.colorScheme.onBackground,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.xSmall),
                    child: Image.asset(Images.urbetrack),
                  ),
                ),
              ),
            ),
            SizedBox(width: context.width * 0.05),
            Expanded(
              child: Text(
                Strings.urbetrackExperience,
                style: context.textTheme.bodyLarge!.copyWith(
                  fontFamily: Fonts.narnoor,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class EducationPage extends StatelessWidget {
  const EducationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Strings.educationDescription,
          style: context.textTheme.titleLarge!.copyWith(
            fontFamily: Fonts.narnoor,
            fontSize: Dimens.large,
          ),
        ),
        const SizedBox(height: Dimens.xxLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HoverAndRedirectContainer(
              url: 'https://udesa.edu.ar',
              child: Container(
                height: context.height * 0.3,
                width: context.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Dimens.small),
                  ),
                  color: context.colorScheme.onBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.xSmall),
                  child: Image.asset(Images.udesa),
                ),
              ),
            ),
            HoverAndRedirectContainer(
              url: 'https://flutter.dev/',
              child: Container(
                height: context.height * 0.3,
                width: context.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Dimens.small),
                  ),
                  color: context.colorScheme.onBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.xSmall),
                  child: Image.asset(Images.flutter),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Hero extends StatelessWidget {
  const Hero({
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
              color: context.colorScheme.secondary,
              height: context.height * 0.875,
              width: context.width,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: context.height * 0.1,
              width: context.width,
              color: context.colorScheme.secondary,
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
                              context.height,
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
                              context.height * 2,
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
                              context.height * 3,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeIn,
                            ),
                            child: Text(
                              'Experience',
                              style: context.textTheme.displaySmall!.copyWith(
                                fontFamily: Fonts.belanosima,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => scrollController.animateTo(
                              context.height * 4,
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
                                    context.colorScheme.primary,
                                    context.colorScheme.tertiary,
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
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    context.colorScheme.primary,
                                    context.colorScheme.tertiary,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimens.xxLarge),
                      SizedBox(
                        width: context.width * 0.4,
                        height: context.height * 0.25,
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
                              speed: const Duration(milliseconds: 40),
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
                              hoverColor: context.colorScheme.tertiary,
                              text: 'CV',
                              onPressed: () {},
                              duration: const Duration(milliseconds: 250),
                            ),
                            AnimatedButton(
                              initialColor: context.colorScheme.primary,
                              hoverColor: context.colorScheme.tertiary,
                              text: 'Contact me',
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
