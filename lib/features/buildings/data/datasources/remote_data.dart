import '../models/building_model.dart';

abstract class BuildingRemoteDataSource {
  Future<List<BuildingModel>> getAllBuildings();
  Future<BuildingModel> getBuildingById(String id);
  Future<List<BuildingModel>> searchBuildings(String query);
}