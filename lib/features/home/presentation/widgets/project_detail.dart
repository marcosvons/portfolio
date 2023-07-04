import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class ProjectDetail extends StatelessWidget {
  ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.codeLink,
    this.projectLink,
  });

  final String title;
  final String description;
  final List<String> images;
  final String codeLink;
  final String? projectLink;

  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.close),
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: carouselController.previousPage,
              child: Icon(
                Icons.arrow_back_ios,
                color: context.colorScheme.secondary,
              ),
            ),
            const SizedBox(width: Dimens.large),
            SizedBox(
              width: context.width * 0.3,
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: context.height * 0.5,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: const [
                  Image(
                    image: AssetImage(Images.maastersLogin),
                  ),
                  Image(
                    image: AssetImage(Images.maastersOnboarding),
                  ),
                  Image(
                    image: AssetImage(Images.maastersOnboarding2),
                  ),
                  Image(
                    image: AssetImage(Images.maastersHome),
                  ),
                ],
              ),
            ),
            const SizedBox(width: Dimens.large),
            GestureDetector(
              onTap: carouselController.nextPage,
              child: Icon(
                Icons.arrow_forward_ios,
                color: context.colorScheme.secondary,
              ),
            ),
            SizedBox(width: context.width * 0.05),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.large),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.displayMedium!.copyWith(
                        color: context.colorScheme.secondary,
                        fontFamily: Fonts.belanosima,
                      ),
                    ),
                    SizedBox(height: context.height * 0.05),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          description,
                          style: context.textTheme.bodyText1!.copyWith(
                            color: context.colorScheme.background,
                            fontFamily: Fonts.narnoor,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AnimatedButton(
                          initialColor: context.colorScheme.background,
                          hoversColor: [
                            context.colorScheme.secondary,
                            const Color.fromARGB(255, 6, 19, 167)
                          ],
                          text: 'View Project',
                          duration: const Duration(milliseconds: 250),
                          onPressed: () => launchURL(
                            'https://github.com/marcosvons/maasters',
                          ),
                        ),
                        if (projectLink != null)
                          AnimatedButton(
                            initialColor: context.colorScheme.background,
                            hoversColor: [
                              context.colorScheme.secondary,
                              const Color.fromARGB(255, 6, 19, 167)
                            ],
                            text: 'Visit Website',
                            duration: const Duration(milliseconds: 250),
                            onPressed: () => launchURL(
                              'https://maasters.tech/',
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
