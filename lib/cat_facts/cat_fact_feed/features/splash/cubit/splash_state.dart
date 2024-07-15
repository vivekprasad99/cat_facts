import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.g.dart';

@CopyWith()
class SplashState extends Equatable {
  final bool? isTimerCompleted;

  const SplashState({this.isTimerCompleted});

  @override
  List<Object?> get props => [isTimerCompleted];
}
