import 'dart:developer';
import '../config/api_service.dart';
import '../model/models.dart';

class TripDebug {
  static Future<void> debugTripsData() async {
    try {
      log('🔍 Debugging Trips Data...');

      // ดึงข้อมูลจาก API
      final tripsData = await ApiService.getTrips();
      log('📊 Raw API Response: $tripsData');
      log('📊 Response Type: ${tripsData.runtimeType}');
      log('📊 Response Length: ${tripsData.length}');

      if (tripsData.isNotEmpty) {
        log('📊 First Trip Raw Data: ${tripsData[0]}');

        // ลองแปลงเป็น Trip object
        final trip = Trip.fromJson(tripsData[0]);
        log('✅ Trip Object Created:');
        log('  - ID: ${trip.idx}');
        log('  - Name: ${trip.name}');
        log('  - Country: ${trip.country}');
        log('  - Price: ${trip.price}');
        log('  - Detail: ${trip.detail}');
        log('  - Cover Image: ${trip.coverimage}');

        // ลองแปลงเป็น TripData
        final tripData = trip.toTripData();
        log('✅ TripData Object Created:');
        log('  - ID: ${tripData.id}');
        log('  - City: ${tripData.city}');
        log('  - Country: ${tripData.country}');
        log('  - Duration: ${tripData.duration}');
        log('  - Price: ${tripData.price}');
        log('  - Category: ${tripData.category}');
        log('  - Detail: ${tripData.detail}');
        log('  - Image Path: ${tripData.imagePath}');
      }
    } catch (e, stackTrace) {
      log('❌ Debug Error: $e');
      log('❌ Stack Trace: $stackTrace');
    }
  }
}
