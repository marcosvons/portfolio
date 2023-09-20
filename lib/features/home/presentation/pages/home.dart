import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/features.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormCubit(dio: Dio()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            backgroundColor: context.colorScheme.background,
            appBar: constraints.maxWidth < Resolutions.mobileMaxWidth
                ? AppBar(
                    backgroundColor: context.colorScheme.background,
                    elevation: 0,
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            context.colorScheme.secondary,
                            context.colorScheme.primary,
                          ],
                        ),
                      ),
                    ),
                  )
                : null,
            endDrawer: constraints.maxWidth < Resolutions.mobileMaxWidth
                ? const PortfolioDrawer()
                : null,
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const HeroSection(),
                  SizedBox(height: context.height * 0.1),
                  const AboutSection(),
                  SizedBox(height: context.height * 0.2),
                  const PortfolioSection(),
                  const ContactSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class PortfolioDrawer extends StatelessWidget {
  const PortfolioDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.5,
      height: context.height * 0.7,
      child: Drawer(
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.xxLarge),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.xxLarge),
          ),
          1,
        ),
        backgroundColor: context.colorScheme.background.withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.medium),
          child: Column(
            children: [
              SizedBox(height: context.height * 0.1),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  width: context.width * 0.2,
                  child: Lottie.asset(Animations.hi),
                ),
              ),
              SizedBox(height: context.height * 0.1),
              GestureDetector(
                onTap: () {
                  Scrollable.ensureVisible(
                    const GlobalObjectKey('about').currentContext!,
                    duration: const Duration(
                      seconds: 1,
                    ),
                    alignment: .5,
                    curve: Curves.easeInOutCubic,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  'About',
                  style: context.textTheme.displaySmall!.copyWith(
                    fontFamily: Fonts.belanosima,
                    fontSize: Dimens.xLarge,
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.075),
              GestureDetector(
                onTap: () {
                  Scrollable.ensureVisible(
                    const GlobalObjectKey('portfolio').currentContext!,
                    duration: const Duration(
                      seconds: 1,
                    ),
                    alignment: .5,
                    curve: Curves.easeInOutCubic,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Portfolio',
                  style: context.textTheme.displaySmall!.copyWith(
                    fontFamily: Fonts.belanosima,
                    fontSize: Dimens.xLarge,
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.075),
              GestureDetector(
                onTap: () {
                  Scrollable.ensureVisible(
                    const GlobalObjectKey('contact').currentContext!,
                    duration: const Duration(
                      seconds: 1,
                    ),
                    alignment: .5,
                    curve: Curves.easeInOutCubic,
                  );
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Contact',
                  style: context.textTheme.displaySmall!.copyWith(
                    fontFamily: Fonts.belanosima,
                    fontSize: Dimens.xLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
