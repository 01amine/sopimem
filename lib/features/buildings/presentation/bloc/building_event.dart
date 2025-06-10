abstract class BuildingEvent {}

class GetAllBuildingsEvent extends BuildingEvent {}
class GetBuildingDetailsEvent extends BuildingEvent {
  final String id;
  GetBuildingDetailsEvent(this.id);
}
class FilterBuildingsEvent extends BuildingEvent {
  final String query;
  FilterBuildingsEvent(this.query);
}