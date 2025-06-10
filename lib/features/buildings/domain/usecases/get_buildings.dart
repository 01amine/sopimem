import '../entities/building.dart';
import '../repositories/building_repository.dart';

class GetBuildings {
  final BuildingRepository repository;

  GetBuildings(this.repository);

  Future<List<Building>> call() => repository.getBuildings();
}