import 'package:antiradar/src/feature/antiradar/domain/repositories/driwe_repository.dart';
import 'package:antiradar/src/feature/antiradar/domain/repositories/read_excel_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AntiradarBloc extends Bloc<AntiradarEvent, AntiradarState> {
  AntiradarBloc(
    this._driweRepository,
    this._readExcelRepo,
  ) : super(AntiradarState()) {
    on<GetUserPosition>(_fetchCameraPositionList);
  }

  final IReadExcelRepository _readExcelRepo;
  final IDriweRepository _driweRepository;

  Future<void> _fetchCameraPositionList(
      GetUserPosition event, Emitter<AntiradarState> emit) async {
    _driweRepository.getPositionSteam().listen((position)  {
      emit(AntiradarState().copyWith(speed: position.speed));
    });
  }
}

final class AntiradarState {
  AntiradarState({
    this.speed = 0.0,
  });

  final double speed;

  AntiradarState copyWith({double? speed}) {
    return AntiradarState(speed: speed ?? this.speed);
  }
}

abstract class AntiradarEvent {}

final class GetUserPosition extends AntiradarEvent {}
