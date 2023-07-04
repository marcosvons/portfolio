import 'package:flutter/material.dart';
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
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        children: [
          HeroSection(
            scrollController: _scrollController,
          ),
          SizedBox(height: context.height * 0.1),
          const AboutSection(),
          SizedBox(height: context.height * 0.2),
          const PortfolioSection(),
          Container(
            height: context.height,
            width: context.width,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
