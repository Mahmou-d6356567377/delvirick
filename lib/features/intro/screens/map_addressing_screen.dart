import 'package:delvirick/core/widgets/custom_text_field.dart';
import 'package:delvirick/features/intro/screens/widgets/map_address_wdiget.dart';
import 'package:delvirick/core/utils/consts/colors.dart';
import 'package:delvirick/core/utils/consts/fonts.dart';

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

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40.0,
                  horizontal: 16.0,
                ),
                child: CustomTextField(
                  hintstyle: ConstFonts.fontboldgreen.copyWith(
                    color: ConstColors.lightgreen,
                  ),
                  controller: TextEditingController(
                    text: selectedAddress ?? '',
                  ),
                  hintText: 'Find your location',

                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.search, color: ConstColors.primaryColor),
                  ),
                ),
              ),
              Spacer(),
              MapAddressWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
