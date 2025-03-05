part of 'package_bloc.dart';

abstract class PackageState extends Equatable {
  const PackageState();  

  @override
  List<Object> get props => [];
}
class PackageInitial extends PackageState {}
