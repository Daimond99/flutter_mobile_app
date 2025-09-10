import 'package:flutter/material.dart';
import 'package:flutter_ui_1/ui_1/showtrip_ui.dart';
import 'package:flutter_ui_1/pages/trip_detail.dart';
import '../config/api_service.dart';
import '../model/models.dart';
import '../debug/trip_debug.dart';
import '../data/sample_trips.dart';

class ShowTripPage extends StatefulWidget {
  const ShowTripPage({super.key});

  @override
  State<ShowTripPage> createState() => _ShowTripPageState();
}

class _ShowTripPageState extends State<ShowTripPage> {
  List<TripData> trips = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  Future<void> _loadTrips() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = '';
      });

      // Debug: ตรวจสอบข้อมูลจาก API
      await TripDebug.debugTripsData();

      final tripsData = await ApiService.getTrips();
      final tripsList = tripsData.map((tripJson) {
        final trip = Trip.fromJson(tripJson);
        return trip.toTripData();
      }).toList();

      setState(() {
        trips = tripsList;
        isLoading = false;
      });
    } catch (e) {
      print('API Error: $e');

      // ใช้ข้อมูลตัวอย่างเมื่อ API ไม่ทำงาน
      setState(() {
        trips = SampleTrips.getSampleTrips();
        errorMessage = 'ใช้ข้อมูลตัวอย่าง (API ไม่พร้อมใช้งาน)';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShowTripUI(
      trips: trips,
      isLoading: isLoading,
      errorMessage: errorMessage,
      onRefresh: _loadTrips,
      onTripTap: (trip) {
        // Navigate to trip detail page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TripDetailPage(trip: trip)),
        );
      },
    );
  }
}
