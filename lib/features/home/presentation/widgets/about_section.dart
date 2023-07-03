import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      color: context.colorScheme.background,
      child: Stack(
        children: [
          CustomPaint(
            painter: DecorativeSpotsPainter(
              numSpots: 50,
              spotColor: context.colorScheme.secondary,
            ),
            size: MediaQuery.of(context).size,
          ),
          Padding(
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
        ],
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
