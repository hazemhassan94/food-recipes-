import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/advice_repo.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  final AdviceRepo repo;
  AdviceCubit(this.repo) : super(AdviceInitial());

  Future<void> getAdvice() async {
    emit(AdviceLoading());
    try {
      final advice = await repo.fetchAdvice();
      emit(AdviceLoaded(advice));
    } catch (e) {
      emit(AdviceError("Error: ${e.toString()}"));
    }
  }
}