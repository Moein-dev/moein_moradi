import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'package_event.dart';
part 'package_state.dart';

class PackageBloc extends Bloc<PackageEvent, PackageState> {
  PackageBloc() : super(PackageInitial()) {
    on<PackageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
