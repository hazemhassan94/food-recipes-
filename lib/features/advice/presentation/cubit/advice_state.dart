part of 'advice_cubit.dart';

@immutable
abstract class AdviceState {}

class AdviceInitial extends AdviceState {}

class AdviceLoading extends AdviceState {}

class AdviceLoaded extends AdviceState {
  final String advice;
  AdviceLoaded(this.advice);
}

class AdviceError extends AdviceState {
  final String message;
  AdviceError(this.message);
}