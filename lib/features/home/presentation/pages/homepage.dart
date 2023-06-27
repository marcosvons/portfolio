import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.height * 0.1),
        child: AppBar(
          title: Text(
            Strings.websiteUnderConstructionTitle,
            style:
                context.textTheme.displayLarge!.copyWith(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.xxLarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  Strings.websiteUnderConstruction,
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.tertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimens.xxLarge * 1.5),
                Text(
                  'Meanwhile...',
                  style: context.textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: Dimens.xxLarge * 1.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: context.width * 0.3,
                      height: context.height * 0.1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            context.colorScheme.onPrimary,
                          ),
                        ),
                        child: Text(
                          'Checkout my LinkedIn profile',
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          js.context.callMethod(
                            'open',
                            ['https://www.linkedin.com/in/marcosvonstremayr'],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.3,
                      height: context.height * 0.1,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            context.colorScheme.onPrimary,
                          ),
                        ),
                        child: Text(
                          'Checkout my GitHub profile',
                          style: context.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          js.context.callMethod(
                            'open',
                            ['https://github.com/marcosvons'],
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
