import 'package:flutter/material.dart';
import 'package:portfolio/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(
  String url,
  BuildContext context, {
  required String errorMessage,
}) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          errorMessage,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onBackground,
            fontFamily: Fonts.narnoor,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }
}
