part of 'form_cubit.dart';

@freezed
class FormState with _$FormState {
  const factory FormState({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String message,
    String? company,
    @Default(false) bool isFormValid,
    @Default(false) bool isSubmitting,
    @Default(false) bool isSuccess,
    @Default(false) bool isFailure,
    String? errorMessage,
  }) = _FormState;
}
