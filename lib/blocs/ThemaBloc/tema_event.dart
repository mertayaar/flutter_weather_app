part of 'tema_bloc.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends TemaEvent {
  final String? weather;
  const ChangeThemeEvent({@required this.weather});
  @override
  List<Object> get props => [weather!];
}
