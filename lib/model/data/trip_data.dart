/// Trip data model for UI display
/// This represents the data structure used by the UI components
class TripData {
  final int id;
  final String country;
  final String city;
  final String duration;
  final String price;
  final String imagePath;
  final String category;
  final String detail;

  TripData({
    required this.id,
    required this.country,
    required this.city,
    required this.duration,
    required this.price,
    required this.imagePath,
    required this.category,
    this.detail = '',
  });

  /// Copy constructor for creating a new instance with modified fields
  TripData copyWith({
    int? id,
    String? country,
    String? city,
    String? duration,
    String? price,
    String? imagePath,
    String? category,
    String? detail,
  }) {
    return TripData(
      id: id ?? this.id,
      country: country ?? this.country,
      city: city ?? this.city,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      category: category ?? this.category,
      detail: detail ?? this.detail,
    );
  }

  @override
  String toString() {
    return 'TripData{id: $id, country: $country, city: $city, duration: $duration, price: $price, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TripData && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}