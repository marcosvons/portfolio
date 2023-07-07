import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_state.dart';
part 'form_cubit.freezed.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit({required Dio dio})
      : _dio = dio,
        super(const FormState());

  final Dio _dio;
  static const _serviceId = 'service_ahr3nve';
  static const _templateId = 'template_ayloo8p';
  static const _publicKey = 'q8eGke376RAZ7K0Pq';

  FutureOr<void> validateForm({
    String? fullName,
    String? email,
    String? message,
    String? phoneNumber,
    String? company,
    String? projectDetails,
  }) {
    emit(
      state.copyWith(
        fullName: fullName ?? state.fullName,
        email: email ?? state.email,
        message: message ?? state.message,
        phoneNumber: phoneNumber ?? state.phoneNumber,
        company: company ?? state.company,
        projectDetails: projectDetails ?? state.projectDetails,
      ),
    );
    final isEmailInvalid = emailValidator(state.email);
    if (state.fullName.isEmpty ||
        state.email.isEmpty ||
        state.message.isEmpty ||
        isEmailInvalid) {
      emit(
        state.copyWith(
          isFormValid: false,
          errorMessage: isEmailInvalid &&
                  state.fullName.isNotEmpty &&
                  state.email.isNotEmpty &&
                  state.message.isNotEmpty
              ? 'Please enter a valid email'
              : 'Please fill all the required fields',
        ),
      );
    } else {
      emit(state.copyWith(isFormValid: true));
    }
  }

  FutureOr<void> submitForm() async {
    emit(state.copyWith(isSubmitting: true));
    await _dio
        .post(
      'https://api.emailjs.com/api/v1.0/email/send',
      data: {
        'service_id': _serviceId,
        'template_id': _templateId,
        'user_id': _publicKey,
        'template_params': {
          'from_name': state.fullName,
          'from_email': state.email,
          'email': state.email,
          'message': state.message,
          'phone_number': state.phoneNumber,
          'company_organization': state.company,
          'project_details': state.projectDetails,
        }
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    )
        .then((value) {
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: true,
          fullName: '',
          email: '',
          message: '',
          phoneNumber: '',
          company: '',
          projectDetails: '',
          isFormValid: false,
        ),
      );
    }).catchError((error) {
      emit(
        state.copyWith(
          isSubmitting: false,
          isFailure: true,
          errorMessage: error.toString(),
        ),
      );
    });
  }

  bool emailValidator(String value) {
    if (value.isEmpty) return true;
    if (!_emailRegExp.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
  );
}
