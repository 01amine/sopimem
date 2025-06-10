import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_buildings.dart';
import '../../domain/usecases/get_building_details.dart';
import '../../domain/usecases/filter_building.dart';
import 'building_event.dart';
import 'building_state.dart';

class BuildingBloc extends Bloc<BuildingEvent, BuildingState> {
  final GetBuildings getBuildings;
  final GetBuildingDetails getBuildingDetails;
  final FilterBuilding filterBuilding;

  BuildingBloc({
    required this.getBuildings,
    required this.getBuildingDetails,
    required this.filterBuilding,
  }) : super(BuildingInitial()) {
    on<GetAllBuildingsEvent>((event, emit) async {
      emit(BuildingLoading());
      try {
        final buildings = await getBuildings();
        emit(BuildingsLoaded(buildings));
      } catch (e) {
        emit(BuildingError(e.toString()));
      }
    });

    on<GetBuildingDetailsEvent>((event, emit) async {
      emit(BuildingLoading());
      try {
        final building = await getBuildingDetails(event.id);
        emit(BuildingDetailsLoaded(building));
      } catch (e) {
        emit(BuildingError(e.toString()));
      }
    });

    on<FilterBuildingsEvent>((event, emit) async {
      emit(BuildingLoading());
      try {
        final buildings = await filterBuilding(event.query);
        emit(BuildingsLoaded(buildings));
      } catch (e) {
        emit(BuildingError(e.toString()));
      }
    });
  }
}