import '../../domain/entities/building.dart';
import '../../domain/repositories/building_repository.dart';
import '../datasources/remote_data.dart';

class BuildingRepositoryImpl implements BuildingRepository {
  final BuildingRemoteDataSource remoteDataSource;

  BuildingRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Building>> getBuildings() async {
    return await remoteDataSource.getAllBuildings();
  }

  @override
  Future<Building> getBuildingDetails(String id) async {
    return await remoteDataSource.getBuildingById(id);
  }

  @override
  Future<List<Building>> filterBuildings(String query) async {
    return await remoteDataSource.searchBuildings(query);
  }
}