part of 'lmi_bloc.dart';

abstract class LmiState extends Equatable {
  const LmiState();
  
  @override
  List<Object> get props => [];
}

class LmiInitial extends LmiState {}
