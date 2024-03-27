import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: const GlobalObjectKey('portfolio'),
      builder: (context, constraints) {
        return Container(
          width: context.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.secondary,
                context.colorScheme.primary,
              ],
            ),
          ),
          child: Stack(
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: context.colorScheme.background,
                  height: context.height * 0.5,
                  width: context.width,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.1,
                  vertical: Dimens.xxLarge,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GradientText(
                          'Portfolio',
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
                        if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                          const Spacer(),
                        if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                          GithubButton(
                            constraints: constraints,
                          ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxWidth > Resolutions.mobileMaxWidth
                          ? context.height * 0.1
                          : context.height * 0.05,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      crossAxisCount:
                          constraints.maxWidth > Resolutions.mobileMaxWidth
                              ? 2
                              : 1,
                      childAspectRatio:
                          constraints.maxWidth > Resolutions.mobileMaxWidth
                              ? (context.width / 0.75) / (context.height / 1.25)
                              : 4 / 1,
                      mainAxisSpacing: context.width * 0.05,
                      crossAxisSpacing: context.width * 0.05,
                      children: [
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.urbetrackLiteTitle,
                              description: Strings.urbetrackLiteDescription,
                              images: [
                                Images.lite1,
                                Images.lite2,
                                Images.lite3,
                                Images.lite4,
                                Images.lite5,
                              ],
                              appStoreLink: Strings.urbetrackLiteAppStoreLink,
                              playStoreLink: Strings.urbetrackLitePlayStoreLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                constraints.maxWidth >
                                        Resolutions.mobileMaxWidth
                                    ? Dimens.xSmall
                                    : Dimens.xxLarge,
                              ),
                              child: Image.asset(
                                Images.urbeLiteLogo,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.urbeFleetTitle,
                              description: Strings.urbeFleetDescription,
                              images: [
                                Images.fleet1,
                                Images.fleet2,
                                Images.fleet3,
                                Images.fleet4,
                              ],
                              appStoreLink: Strings.urbeFleetAppStoreLink,
                              playStoreLink: Strings.urbeFleetPlayStoreLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                constraints.maxWidth >
                                        Resolutions.mobileMaxWidth
                                    ? Dimens.xSmall
                                    : Dimens.xxLarge,
                              ),
                              child: Image.asset(
                                Images.urbeFleetLogo,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.driverTitle,
                              description: Strings.driverDescription,
                              images: [
                                Images.driver1,
                                Images.driver2,
                                Images.driver3,
                                Images.driver4,
                                Images.driver5,
                              ],
                              appStoreLink: Strings.driverAppStoreLink,
                              playStoreLink: Strings.driverPlayStoreLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                constraints.maxWidth >
                                        Resolutions.mobileMaxWidth
                                    ? Dimens.xSmall
                                    : Dimens.xxLarge,
                              ),
                              child: Image.asset(
                                Images.driverLogo,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.checkTitle,
                              description: Strings.checkDescription,
                              images: [
                                Images.check1,
                                Images.check2,
                                Images.check3,
                                Images.check4,
                                Images.check5,
                              ],
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                constraints.maxWidth >
                                        Resolutions.mobileMaxWidth
                                    ? Dimens.xSmall
                                    : Dimens.xxLarge,
                              ),
                              child: Image.asset(
                                Images.checkLogo,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.passTitle,
                              description: Strings.passDescription,
                              images: [
                                Images.pass1,
                                Images.pass2,
                                Images.pass3,
                                Images.pass4,
                                Images.pass5,
                              ],
                              playStoreLink: Strings.passPlayStoreLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                constraints.maxWidth >
                                        Resolutions.mobileMaxWidth
                                    ? Dimens.xSmall
                                    : Dimens.xxLarge,
                              ),
                              child: Image.asset(
                                Images.passLogo,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.maastersTitle,
                              description: Strings.maastersDescription,
                              images: [
                                Images.maastersLogin,
                                Images.maastersOnboarding,
                                Images.maastersOnboarding2,
                                Images.maastersOnboarding3,
                                Images.maastersOnboarding4,
                                Images.maastersHome,
                              ],
                              codeLink: Strings.maastersCodeLink,
                              projectLink: Strings.maastersLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                constraints.maxWidth >
                                        Resolutions.mobileMaxWidth
                                    ? Dimens.xSmall
                                    : Dimens.xxLarge,
                              ),
                              child: Image.asset(
                                Images.maasters,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.rickAndMortyTitle,
                              description: Strings.rickAndMortyDescription,
                              images: [
                                Images.rickAndMortyLogin,
                                Images.rickAndMortyDrawer,
                                Images.rickAndMortyHome,
                                Images.rickAndMortyCharacter,
                                Images.rickAndMortyFavorites,
                              ],
                              codeLink: Strings.rickAndMortyCodeLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.xSmall),
                              child: Image.asset(
                                Images.rickAndMortyLogo,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.hearthstoneTitle,
                              description: Strings.hearthstoneDescription,
                              images: [
                                Images.hearthstoneHome,
                                Images.hearthstoneDrawer,
                                Images.hearthstoneCards,
                              ],
                              video: Strings.hearthstoneCardFlipVideo,
                              codeLink: Strings.hearthstoneCodeLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.xSmall),
                              child: Image.asset(
                                Images.hearthstoneLogo,
                              ),
                            ),
                          ),
                        ),
                        HoverAndRedirectContainer(
                          onPressed: () {
                            buildPopupContainer(
                              context,
                              title: Strings.starWarsTitle,
                              description: Strings.starWarsDescription,
                              images: [
                                Images.starWarsHome,
                                Images.starWarsCharacters,
                                Images.starWarsCharacterDetail,
                                Images.starWarsCharacterSighting,
                              ],
                              codeLink: Strings.starWarsCodeLink,
                              constraints: constraints,
                            );
                          },
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(Dimens.small),
                              ),
                              color: context.colorScheme.surface,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.xSmall),
                              child: Image.asset(
                                Images.starWarsLogo,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (constraints.maxWidth < Resolutions.mobileMaxWidth)
                      Column(
                        children: [
                          const SizedBox(
                            height: Dimens.xxLarge,
                          ),
                          GithubButton(
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

class GithubButton extends StatelessWidget {
  const GithubButton({
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
        height: context.height * 0.075,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.small),
            ),
            backgroundColor: context.colorScheme.primary,
          ),
          onPressed: () => launchURL(
            Strings.githubProfile,
            context,
            errorMessage: 'An error occurred while trying to open Github.',
          ),
          child: Row(
            children: [
              Image.asset(
                Images.githubLogo,
                height: context.height * 0.05,
                color: context.colorScheme.onBackground,
              ),
              const SizedBox(width: Dimens.medium),
              Text(
                'View more projects on GitHub',
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
