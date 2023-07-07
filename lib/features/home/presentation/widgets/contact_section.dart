import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/core.dart';
import 'package:portfolio/features/features.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final companyController = TextEditingController();
  final phoneController = TextEditingController();
  final projectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormCubit, FormState>(
      listenWhen: (previous, current) =>
          previous.isSuccess != current.isSuccess,
      listener: (context, state) {
        if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Thank you for connecting! I look forward to exploring exciting opportunities together.',
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.onBackground,
                  fontFamily: Fonts.narnoor,
                ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: context.colorScheme.background,
            ),
          );
          nameController.clear();
          emailController.clear();
          messageController.clear();
          phoneController.clear();
          projectController.clear();
          companyController.clear();
        }
      },
      child: Container(
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: context.width * 0.1),
                child: RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    'Contact Me',
                    style: context.textTheme.displayLarge!.copyWith(
                      fontFamily: Fonts.belanosima,
                      fontSize: 100,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.large),
                  color: context.colorScheme.background,
                ),
                height: context.height * 0.85,
                width: context.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.medium),
                  child: BlocBuilder<FormCubit, FormState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.contactTitle,
                            style: context.textTheme.displayMedium!.copyWith(
                              fontFamily: Fonts.belanosima,
                              color: context.colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(height: Dimens.xSmall),
                          Text(
                            Strings.contactSubtitle,
                            style: context.textTheme.titleLarge!.copyWith(
                              fontFamily: Fonts.narnoor,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: Dimens.xLarge),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              label: Text(
                                'Full Name*',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontFamily: Fonts.narnoor,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(Dimens.xSmall),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.tertiary,
                                ),
                              ),
                              focusColor: context.colorScheme.secondary,
                              border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            onChanged: (value) => context
                                .read<FormCubit>()
                                .validateForm(fullName: value),
                          ),
                          const SizedBox(height: Dimens.medium),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              label: Text(
                                'Email Address*',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontFamily: Fonts.narnoor,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(Dimens.xSmall),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.tertiary,
                                ),
                              ),
                              focusColor: context.colorScheme.secondary,
                              border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            onChanged: (value) => context
                                .read<FormCubit>()
                                .validateForm(email: value),
                          ),
                          const SizedBox(height: Dimens.medium),
                          TextFormField(
                            controller: messageController,
                            decoration: InputDecoration(
                              label: Text(
                                'Message/Inquiry*',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontFamily: Fonts.narnoor,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(Dimens.xSmall),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.tertiary,
                                ),
                              ),
                              focusColor: context.colorScheme.secondary,
                              border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            onChanged: (value) => context
                                .read<FormCubit>()
                                .validateForm(message: value),
                          ),
                          const SizedBox(height: Dimens.medium),
                          TextFormField(
                            controller: companyController,
                            decoration: InputDecoration(
                              label: Text(
                                'Company/Organization (Optional)',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontFamily: Fonts.narnoor,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(Dimens.xSmall),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.tertiary,
                                ),
                              ),
                              focusColor: context.colorScheme.secondary,
                              border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            onChanged: (value) => context
                                .read<FormCubit>()
                                .validateForm(company: value),
                          ),
                          const SizedBox(height: Dimens.medium),
                          TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              label: Text(
                                'Phone number (Optional)',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontFamily: Fonts.narnoor,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(Dimens.xSmall),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.tertiary,
                                ),
                              ),
                              focusColor: context.colorScheme.secondary,
                              border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            onChanged: (value) => context
                                .read<FormCubit>()
                                .validateForm(phoneNumber: value),
                          ),
                          const SizedBox(height: Dimens.medium),
                          TextFormField(
                            controller: projectController,
                            decoration: InputDecoration(
                              label: Text(
                                'Project Details (Optional)',
                                style: context.textTheme.bodySmall!.copyWith(
                                  fontFamily: Fonts.narnoor,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.all(Dimens.xSmall),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.tertiary,
                                ),
                              ),
                              focusColor: context.colorScheme.secondary,
                              border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.xSmall),
                                borderSide: BorderSide(
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            onChanged: (value) => context
                                .read<FormCubit>()
                                .validateForm(projectDetails: value),
                          ),
                          const SizedBox(height: Dimens.xxLarge),
                          Align(
                            child: AnimatedButton(
                              initialColor: state.isFormValid
                                  ? context.colorScheme.primary
                                  : context.colorScheme.shadow,
                              hoversColor: state.isFormValid
                                  ? [
                                      context.colorScheme.tertiary,
                                      const Color(0xFF7BF4E8),
                                    ]
                                  : [
                                      context.colorScheme.shadow,
                                    ],
                              child: state.isSubmitting
                                  ? const SizedBox(
                                      height: Dimens.medium,
                                      width: Dimens.medium,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'Send',
                                      style:
                                          context.textTheme.bodyLarge!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: Fonts.narnoor,
                                      ),
                                    ),
                              onPressed: () {
                                if (state.isFormValid) {
                                  context.read<FormCubit>().submitForm();
                                } else {
                                  if (state.errorMessage != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                            context.colorScheme.background,
                                        content: Text(
                                          state.errorMessage!,
                                          textAlign: TextAlign.center,
                                          style: context.textTheme.bodyMedium!
                                              .copyWith(
                                            color: context
                                                .colorScheme.onBackground,
                                            fontFamily: Fonts.narnoor,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: Dimens.large),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Developed by me with ❤️',
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: context.colorScheme.onPrimary,
                    fontFamily: Fonts.narnoor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
