class Building {
  final String id;
  final String name;
  final String location;
  final String description;
  final String fullDescription;
  final String aboutText;
  final String image;
  final List<String> gallery;
  final double price;
  final String propertyType;
  final double size;
  final int bedrooms;
  final int bathrooms;
  final String status;
  final List<String> tags;
  final List<String> features;
  final List<String> amenities;
  final List<String> nearbyAmenities;
  final List<FloorPlan> floorPlans;
  final MapPosition mapPosition;
  final Agent agent;

  Building({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.fullDescription,
    required this.aboutText,
    required this.image,
    required this.gallery,
    required this.price,
    required this.propertyType,
    required this.size,
    required this.bedrooms,
    required this.bathrooms,
    required this.status,
    required this.tags,
    required this.features,
    required this.amenities,
    required this.nearbyAmenities,
    required this.floorPlans,
    required this.mapPosition,
    required this.agent,
  });
}

class FloorPlan {
  final String id;
  final String name;
  final String image;
  final String size;
  final int bedrooms;
  final int bathrooms;
  final String description;

  FloorPlan({
    required this.id,
    required this.name,
    required this.image,
    required this.size,
    required this.bedrooms,
    required this.bathrooms,
    required this.description,
  });
}

class MapPosition {
  final double lat;
  final double lng;

  MapPosition({required this.lat, required this.lng});
}

class Agent {
  final String name;
  final String title;
  final String phone;
  final String email;
  final String? image;

  Agent({
    required this.name,
    required this.title,
    required this.phone,
    required this.email,
    this.image,
  });
}