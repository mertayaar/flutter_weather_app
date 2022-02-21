part of 'tema_bloc.dart';

abstract class TemaState extends Equatable {
  const TemaState();

  @override
  List<Object> get props => [];
}

class AppTheme extends TemaState {
  final ThemeData? tema;
  final MaterialColor? renk;
  const AppTheme({@required this.tema, @required this.renk});
  @override
  List<Object> get props => [tema!, renk!];
}
