import '../../domain/entities/building.dart';

class BuildingModel extends Building {
  BuildingModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          name: json['name'],
          location: json['location'],
          description: json['description'],
          fullDescription: json['fullDescription'],
          aboutText: json['aboutText'],
          image: json['image'],
          gallery: List<String>.from(json['gallery'] ?? []),
          price: json['price'].toDouble(),
          propertyType: json['propertyType'],
          size: json['size'].toDouble(),
          bedrooms: json['bedrooms'],
          bathrooms: json['bathrooms'],
          status: json['status'],
          tags: List<String>.from(json['tags'] ?? []),
          features: List<String>.from(json['features'] ?? []),
          amenities: List<String>.from(json['amenities'] ?? []),
          nearbyAmenities: List<String>.from(json['nearbyAmenities'] ?? []),
          floorPlans: (json['floorPlans'] as List?)?.map((e) => FloorPlan(
                id: e['id'],
                name: e['name'],
                image: e['image'],
                size: e['size'],
                bedrooms: e['bedrooms'],
                bathrooms: e['bathrooms'],
                description: e['description'],
              )).toList() ??
              [],
          mapPosition: MapPosition(
            lat: json['mapPosition']['lat'],
            lng: json['mapPosition']['lng'],
          ),
          agent: Agent(
            name: json['agent']['name'],
            title: json['agent']['title'],
            phone: json['agent']['phone'],
            email: json['agent']['email'],
            image: json['agent']['image'],
          ),
        );
}