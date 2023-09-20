import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: const GlobalObjectKey('about'),
      builder: (context, constraints) {
        return ColoredBox(
          color: context.colorScheme.background,
          child: Stack(
            children: [
              ClipPath(
                clipper: ArtisticBackgroundClipper(),
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth > Resolutions.mobileMaxWidth
                      ? Dimens.xxLarge
                      : Dimens.small,
                  vertical: Dimens.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth > Resolutions.mobileMaxWidth
                            ? context.width * 0.1
                            : Dimens.medium,
                        right: constraints.maxWidth > Resolutions.mobileMaxWidth
                            ? context.width * 0.1
                            : Dimens.medium,
                        bottom: Dimens.xxLarge,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GradientText(
                            'About',
                            gradient: LinearGradient(
                              colors: [
                                context.colorScheme.tertiary,
                                context.colorScheme.primary,
                              ],
                            ),
                            style: context.textTheme.displayLarge!.copyWith(
                              fontFamily: Fonts.belanosima,
                              fontSize: constraints.maxWidth >
                                      Resolutions.mobileMaxWidth
                                  ? 80
                                  : 50,
                            ),
                          ),
                          const Spacer(),
                          if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                            LinkedinButton(
                              constraints: constraints,
                            ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: constraints.maxWidth > Resolutions.mobileMaxWidth
                            ? context.width * 0.6
                            : context.width * 0.85,
                        child: Text(
                          Strings.aboutText,
                          style: context.textTheme.displaySmall!.copyWith(
                            color: context.colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.narnoor,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // child: SizedBox(
                      //   width: constraints.maxWidth > Resolutions.mobileMaxWidth
                      //       ? context.width * 0.8
                      //       : context.width,
                      //   height:
                      //       constraints.maxWidth > Resolutions.mobileMaxWidth
                      //           ? context.height * 0.75
                      //           : context.height * 0.6,
                      //   child: AboutPageView(
                      //     constraints: constraints,
                      //     scrollController: scrollController,
                      //   ),
                      // ),
                    ),
                    if (constraints.maxWidth < Resolutions.mobileMaxWidth)
                      Column(
                        children: [
                          const SizedBox(height: Dimens.xxLarge),
                          LinkedinButton(
                            constraints: constraints,
                          ),
                        ],
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

class LinkedinButton extends StatelessWidget {
  const LinkedinButton({
    super.key,
    required this.constraints,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: constraints.maxWidth > Resolutions.mobileMaxWidth
          ? Alignment.centerLeft
          : Alignment.center,
      child: SizedBox(
        height: constraints.maxWidth > Resolutions.mobileMaxWidth
            ? context.height * 0.075
            : context.height * 0.05,
        width: constraints.maxWidth > Resolutions.mobileMaxWidth
            ? null
            : context.width * 0.5,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
            ),
            backgroundColor: context.colorScheme.primary,
          ),
          onPressed: () => launchURL(
            Strings.linkedinProfile,
            context,
            errorMessage: 'Could not launch LinkedIn profile',
          ),
          child: Row(
            children: [
              Image.asset(
                Images.linkedinLogo,
                height: context.height * 0.025,
                color: context.colorScheme.onBackground,
              ),
              const SizedBox(width: Dimens.medium),
              Text(
                'Visit my LinkedIn',
                style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontFamily: Fonts.narnoor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutPageView extends StatefulWidget {
  const AboutPageView({
    super.key,
    required this.constraints,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final BoxConstraints constraints;
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
        SizedBox(
          width: widget.constraints.maxWidth > Resolutions.mobileMaxWidth
              ? context.width * 0.1
              : Dimens.large,
        ),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              EducationPage(
                constraints: widget.constraints,
                scrollController: widget.scrollController,
              ),
              ExperiencePage(
                constraints: widget.constraints,
                scrollController: widget.scrollController,
              ),
              ConclusionPage(
                constraints: widget.constraints,
                scrollController: widget.scrollController,
              ),
            ],
          ),
        ),
        SizedBox(
          width: widget.constraints.maxWidth > Resolutions.mobileMaxWidth
              ? context.width * 0.1
              : Dimens.large,
        ),
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

class ConclusionPage extends StatelessWidget {
  const ConclusionPage({
    super.key,
    required this.constraints,
    required this.scrollController,
  });

  final BoxConstraints constraints;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.aboutConclusion,
            style: context.textTheme.titleLarge!.copyWith(
              fontFamily: Fonts.narnoor,
              fontSize: constraints.maxWidth > Resolutions.mobileMaxWidth
                  ? Dimens.large
                  : Dimens.medium,
            ),
          ),
        ],
      ),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({
    super.key,
    required this.constraints,
    required this.scrollController,
  });

  final ScrollController scrollController;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: Dimens.small,
                  ),
                  child: HoverAndRedirectContainer(
                    onPressed: () async => await launchURL(
                      'https://www.witbor.com/',
                      context,
                      errorMessage: 'Could not launch Witbor website',
                    ),
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
              if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                SizedBox(width: context.width * 0.05),
              Expanded(
                child: Text(
                  Strings.witborExperience,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontFamily: Fonts.narnoor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimens.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Dimens.xSmall,
                    horizontal: Dimens.small,
                  ),
                  child: HoverAndRedirectContainer(
                    onPressed: () async => await launchURL(
                      'https://www.globant.com/',
                      context,
                      errorMessage: 'Could not launch Globant website',
                    ),
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
              if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                SizedBox(width: context.width * 0.05),
              Expanded(
                child: Text(
                  Strings.globantExperience,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontFamily: Fonts.narnoor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimens.large),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: Dimens.small,
                  ),
                  child: HoverAndRedirectContainer(
                    onPressed: () async => await launchURL(
                      'https://www.urbetrack.com/',
                      context,
                      errorMessage: 'Could not launch Urbetrack website',
                    ),
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
              if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                SizedBox(width: context.width * 0.05),
              Expanded(
                child: Text(
                  Strings.urbetrackExperience,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontFamily: Fonts.narnoor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  const EducationPage({
    super.key,
    required this.constraints,
    required this.scrollController,
  });

  final BoxConstraints constraints;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            Strings.educationDescription,
            style: context.textTheme.titleLarge!.copyWith(
              fontFamily: Fonts.narnoor,
              fontSize: constraints.maxWidth > Resolutions.mobileMaxWidth
                  ? Dimens.large
                  : Dimens.medium,
            ),
          ),
          const SizedBox(height: Dimens.large),
          if (constraints.maxWidth > Resolutions.mobileMaxWidth)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HoverAndRedirectContainer(
                  onPressed: () async => await launchURL(
                    'https://udesa.edu.ar',
                    context,
                    errorMessage: 'Could not launch UdeSA website',
                  ),
                  child: Container(
                    height: context.height * 0.2,
                    width: context.width * 0.15,
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
                  onPressed: () async => await launchURL(
                    'https://flutter.dev/',
                    context,
                    errorMessage: 'Could not launch Flutter website',
                  ),
                  child: Container(
                    height: context.height * 0.2,
                    width: context.width * 0.15,
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
            ),
        ],
      ),
    );
  }
}
