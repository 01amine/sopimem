import '../entities/building.dart';

abstract class BuildingRepository {
  Future<List<Building>> getBuildings();
  Future<Building> getBuildingDetails(String id);
  Future<List<Building>> filterBuildings(String query);
}