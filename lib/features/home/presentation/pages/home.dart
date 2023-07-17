import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                ? Drawer(
                    backgroundColor: Colors.black,
                    child: Column(children: const [SizedBox(height: 50)]),
                  )
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
                ContactSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}
