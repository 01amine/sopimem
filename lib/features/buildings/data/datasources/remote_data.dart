import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/building_model.dart';

abstract class BuildingRemoteDataSource {
  Future<List<BuildingModel>> getAllBuildings();
  Future<BuildingModel> getBuildingById(String id);
  Future<List<BuildingModel>> searchBuildings(String query);
}

class BuildingRemoteDataSourceImpl implements BuildingRemoteDataSource {
  final http.Client client;

  BuildingRemoteDataSourceImpl({required this.client});

  String get baseUrl => dotenv.env['API_URL'] ?? '';

  @override
  Future<List<BuildingModel>> getAllBuildings() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/projects'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => BuildingModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException();
    }
  }

  @override
  Future<BuildingModel> getBuildingById(String id) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/projects/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return BuildingModel.fromJson(json);
      } else if (response.statusCode == 404) {
        throw ServerException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException();
    }
  }

  @override
  Future<List<BuildingModel>> searchBuildings(String query) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/projects/search?q=${Uri.encodeComponent(query)}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => BuildingModel.fromJson(json)).toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      if (e is ServerException) {
        rethrow;
      }
      throw ServerException();
    }
  }
}
