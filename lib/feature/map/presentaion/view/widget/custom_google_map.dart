import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:provider/provider.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late GoogleMapController googleMapController;
  late CameraPosition initialCameraPosition;
  @override
  void initState() {
    initialCameraPosition = CameraPosition(
      target: LatLng(30.666814283311574, 30.069335102342595),
      zoom: 14,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      onMapCreated: (controller) {
        googleMapController = controller;
        theme.isDarkTheme ? initMapStyle(true) : initMapStyle(false);
      },
      // cameraTargetBounds: CameraTargetBounds(
      //   LatLngBounds(
      //     southwest: LatLng(30.6496634724146, 30.071086192447044),
      //     northeast: LatLng(30.68012918024992, 30.069146853680078),
      //   ),
      // ),
    );
  }

  void initMapStyle(bool theme) async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style/night_map_style.json");
    var lightMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style/light_map_style.json");
    if (theme) {
      googleMapController.setMapStyle(nightMapStyle);
    } else {
      googleMapController.setMapStyle(lightMapStyle);
    }
  }
}
