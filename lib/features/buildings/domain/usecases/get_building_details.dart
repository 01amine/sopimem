import '../entities/building.dart';
import '../repositories/building_repository.dart';

class GetBuildingDetails {
  final BuildingRepository repository;

  GetBuildingDetails(this.repository);

  Future<Building> call(String id) => repository.getBuildingDetails(id);
}