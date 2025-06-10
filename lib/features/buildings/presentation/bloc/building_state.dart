import '../../domain/entities/building.dart';

abstract class BuildingState {}

class BuildingInitial extends BuildingState {}
class BuildingLoading extends BuildingState {}
class BuildingsLoaded extends BuildingState {
  final List<Building> buildings;
  BuildingsLoaded(this.buildings);
}
class BuildingDetailsLoaded extends BuildingState {
  final Building building;
  BuildingDetailsLoaded(this.building);
}
class BuildingError extends BuildingState {
  final String message;
  BuildingError(this.message);
}