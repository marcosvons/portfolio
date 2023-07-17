import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
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
                        fontSize: 80,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
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
                          errorMessage:
                              'An error occurred while trying to open Github.',
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
                    )
                  ],
                ),
                SizedBox(height: context.height * 0.1),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (context.width / 0.75) / (context.height / 1.25),
                    mainAxisSpacing: context.width * 0.05,
                    crossAxisSpacing: context.width * 0.05,
                    children: [
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
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Dimens.small),
                            ),
                            color: context.colorScheme.surface,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(Dimens.xSmall),
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
                          );
                        },
                        child: Container(
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
                          );
                        },
                        child: Container(
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
                          );
                        },
                        child: Container(
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
