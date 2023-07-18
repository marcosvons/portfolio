import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:video_player/video_player.dart';

class ProjectDetail extends StatefulWidget {
  const ProjectDetail({
    super.key,
    required this.title,
    required this.description,
    required this.images,
    required this.codeLink,
    this.projectLink,
    this.video,
  });

  final String title;
  final String description;
  final List<String> images;
  final String codeLink;
  final String? projectLink;
  final String? video;

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  late final CarouselController carouselController;
  late final VideoPlayerController videoPlayerController;
  late final ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();
    if (widget.video != null) {
      videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.video!),
      );
      videoPlayerController.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
      );
    }
  }

  @override
  void dispose() {
    if (widget.video != null) {
      videoPlayerController.dispose();
      chewieController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
                if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                  GestureDetector(
                    onTap: carouselController.previousPage,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                  const SizedBox(width: Dimens.large),
                if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                  SizedBox(
                    width: context.width * 0.3,
                    child: CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: context.height * 0.5,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(
                          seconds: widget.video != null ? 5 : 3,
                        ),
                      ),
                      items: buildCarouselWidgets(),
                    ),
                  ),
                if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                  const SizedBox(width: Dimens.large),
                if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                  GestureDetector(
                    onTap: carouselController.nextPage,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                  SizedBox(width: context.width * 0.05),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: Dimens.large),
                    child: ListView(
                      children: [
                        Text(
                          widget.title,
                          style: context.textTheme.displayMedium!.copyWith(
                            color: context.colorScheme.secondary,
                            fontFamily: Fonts.belanosima,
                          ),
                        ),
                        SizedBox(height: context.height * 0.05),
                        if (constraints.maxWidth < Resolutions.mobileMaxWidth)
                          CarouselImages(
                            carouselController: carouselController,
                            buildCarouselWidgets: buildCarouselWidgets,
                            video: widget.video,
                          ),
                        Text(
                          widget.description,
                          style: context.textTheme.bodyText1!.copyWith(
                            color: context.colorScheme.background,
                            fontFamily: Fonts.narnoor,
                          ),
                        ),
                        const SizedBox(height: Dimens.large),
                        if (constraints.maxWidth > Resolutions.mobileMaxWidth)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: buttons(constraints),
                          ),
                        if (constraints.maxWidth < Resolutions.mobileMaxWidth)
                          Center(
                            child: Column(
                              children: buttons(constraints),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  List<Widget> buildCarouselWidgets() {
    final widgets = <Widget>[];

    for (var i = 0; i < widget.images.length; i++) {
      final imageWidget = Image.asset(widget.images[i]);
      widgets.add(imageWidget);
    }

    if (widget.video != null) {
      final videoWidget = Chewie(controller: chewieController);
      widgets.add(videoWidget);
    }

    return widgets;
  }

  List<Widget> buttons(BoxConstraints constraints) => [
        AnimatedButton(
          constraints: constraints,
          initialColor: context.colorScheme.background,
          hoversColor: [
            context.colorScheme.secondary,
            const Color.fromARGB(255, 6, 19, 167)
          ],
          duration: const Duration(milliseconds: 250),
          onPressed: () => launchURL(
            widget.codeLink,
            context,
            errorMessage:
                'An error occurred while trying to open the projects code.',
          ),
          child: Text(
            'View Project',
            style: context.textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: Fonts.narnoor,
            ),
          ),
        ),
        if (widget.projectLink != null) const SizedBox(height: Dimens.medium),
        if (widget.projectLink != null)
          AnimatedButton(
            constraints: constraints,
            initialColor: context.colorScheme.background,
            hoversColor: [
              context.colorScheme.secondary,
              const Color.fromARGB(255, 6, 19, 167)
            ],
            duration: const Duration(milliseconds: 250),
            onPressed: () => launchURL(
              widget.projectLink!,
              context,
              errorMessage:
                  'An error occurred while trying to open the projects website.',
            ),
            child: Text(
              'Visit Website',
              style: context.textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: Fonts.narnoor,
              ),
            ),
          ),
      ];
}

class CarouselImages extends StatelessWidget {
  const CarouselImages({
    super.key,
    required this.carouselController,
    required this.buildCarouselWidgets,
    this.video,
  });

  final CarouselController carouselController;
  final String? video;
  final List<Widget> Function() buildCarouselWidgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: carouselController.previousPage,
          child: Icon(
            Icons.arrow_back_ios,
            color: context.colorScheme.secondary,
          ),
        ),
        const SizedBox(width: Dimens.small),
        SizedBox(
          width: context.width * 0.5,
          child: CarouselSlider(
            carouselController: carouselController,
            options: CarouselOptions(
              height: context.height * 0.5,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(
                seconds: video != null ? 5 : 3,
              ),
            ),
            items: buildCarouselWidgets(),
          ),
        ),
        const SizedBox(width: Dimens.small),
        GestureDetector(
          onTap: carouselController.nextPage,
          child: Icon(
            Icons.arrow_forward_ios,
            color: context.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
