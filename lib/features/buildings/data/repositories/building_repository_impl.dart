import '../../domain/entities/building.dart';
import '../../domain/repositories/building_repository.dart';
import '../datasources/remote_data.dart';

class BuildingRepositoryImpl implements BuildingRepository {
  final BuildingRemoteDataSource remoteDataSource;

  BuildingRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Building>> getBuildings() async {
    try {
      final buildings = await remoteDataSource.getAllBuildings();
      return buildings;
    } catch (e) {
      print(e);
      throw Exception('Failed to get buildings: $e');
    }
  }

  @override
  Future<Building> getBuildingDetails(String id) async {
    try {
      final building = await remoteDataSource.getBuildingById(id);
      return building;
    } catch (e) {
      print(e);
      throw Exception('Failed to get building details: $e');
    }
  }
  
  @override
  Future<List<Building>> filterBuildings(String query) async {
    try {
      final buildings = await remoteDataSource.searchBuildings(query);
      return buildings;
    } catch (e) {
      print(e);
      throw Exception('Failed to filter buildings: $e');
    }
  }
    }
  