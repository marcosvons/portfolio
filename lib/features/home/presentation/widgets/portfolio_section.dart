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
      color: context.colorScheme.background,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.1,
          vertical: Dimens.xxLarge,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        color: context.colorScheme.onBackground,
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
                    onPressed: () {},
                    child: Container(
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
                  HoverAndRedirectContainer(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.small),
                        ),
                        color: context.colorScheme.onBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.xSmall),
                        child: Image.asset(Images.maasters),
                      ),
                    ),
                  ),
                  HoverAndRedirectContainer(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Dimens.small),
                        ),
                        color: context.colorScheme.onBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimens.xSmall),
                        child: Image.asset(Images.maasters),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
