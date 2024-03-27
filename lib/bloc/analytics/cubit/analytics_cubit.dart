import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'analytics_state.dart';

class AnalyticsCubit extends Cubit<AnalyticsState> {
  AnalyticsCubit() : super(AnalyticsInitial());

  void logCurrentPage(String title) {
    emit(AnalyticsInitSucsess());
  }
}
