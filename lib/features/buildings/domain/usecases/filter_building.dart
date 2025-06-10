import '../entities/building.dart';
import '../repositories/building_repository.dart';

class FilterBuilding {
  final BuildingRepository repository;

  FilterBuilding(this.repository);

  Future<List<Building>> call(String query) => repository.filterBuildings(query);
}