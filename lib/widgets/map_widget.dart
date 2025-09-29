import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key, required this.onLocationSelected});

  final Function(LatLng) onLocationSelected; // callback to parent

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  List<Marker> markers = [];

  static const CameraPosition firstPosition = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(30.80629720571971, 31.323528085969762),
    tilt: 59.440717697143555,
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: GoogleMap(
        markers: markers.toSet(),
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: firstPosition,
        onTap: (LatLng tappedPosition) {
          markers.clear();
          markers.add(
            Marker(markerId: MarkerId('selected'), position: tappedPosition),
          );

          widget.onLocationSelected(tappedPosition); // notify parent
          setState(() {});
        },
        onMapCreated: (controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
