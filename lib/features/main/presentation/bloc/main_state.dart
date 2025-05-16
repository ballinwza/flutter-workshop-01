import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  // const MainState();

  @override
  List<Object> get props => [];
}

class MainIncrement extends MainState {}

class MainDecrement extends MainState {}
