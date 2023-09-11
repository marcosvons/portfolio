import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/features.dart';

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
    return BlocProvider(
      create: (context) => FormCubit(dio: Dio()),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: constraints.maxWidth < Resolutions.mobileMaxWidth
                ? AppBar(
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
                ? PortfolioDrawer(scrollController: _scrollController)
                : null,
            body: ListView(
              physics: const ClampingScrollPhysics(),
              controller: _scrollController,
              children: [
                HeroSection(
                  scrollController: _scrollController,
                ),
                SizedBox(height: context.height * 0.1),
                const AboutSection(),
                SizedBox(height: context.height * 0.2),
                const PortfolioSection(),
                const ContactSection(),
              ],
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
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

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
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                  );
                },
                child: SizedBox(
                  width: context.width * 0.2,
                  child: Lottie.asset(Animations.hi),
                ),
              ),
              SizedBox(height: context.height * 0.1),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  _scrollController.animateTo(
                    context.height * 1 + kToolbarHeight,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                  );
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
                  Navigator.of(context).pop();

                  _scrollController.animateTo(
                    context.height * 2.1 + kToolbarHeight,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                  );
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
                  Navigator.of(context).pop();

                  _scrollController.animateTo(
                    context.height * 3.3,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeIn,
                  );
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
