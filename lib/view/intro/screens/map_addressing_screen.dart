import 'package:delvirick/widgets/custom_button.dart';
import 'package:delvirick/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart'; // <-- add this in pubspec.yaml

class MapAddressingScreen extends StatefulWidget {
  const MapAddressingScreen({super.key, required this.isadmin});
  final bool isadmin;

  @override
  State<MapAddressingScreen> createState() => _MapAddressingScreenState();
}

class _MapAddressingScreenState extends State<MapAddressingScreen> {
  LatLng? selectedLocation;
  String? selectedAddress;

  Future<void> _getAddressFromLatLng(LatLng pos) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        pos.latitude,
        pos.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          selectedAddress =
              "${place.street}, ${place.locality}, ${place.country}";
        });
      }
    } catch (e) {
      setState(() {
        selectedAddress = "تعذر الحصول على العنوان";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapWidget(
            onLocationSelected: (LatLng pos) {
              setState(() {
                selectedLocation = pos;
                selectedAddress = null; // reset while fetching
              });
              _getAddressFromLatLng(pos);
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
            child: CustomButton(
              onpress: () {
                if (selectedLocation != null) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("اختر موقعًا أولاً")),
                  );
                }
              },
              title:
                  widget.isadmin
                      ? 'الوصول الى العميل'
                      : 'الوصول الى عنوان الطلب',
            ),
          ),
        ],
      ),
    );
  }
}
