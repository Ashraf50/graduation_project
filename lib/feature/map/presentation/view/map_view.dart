import 'package:flutter/material.dart';
import 'package:graduation_project/feature/map/presentation/view/widget/map_view_body.dart';

class MapViewPage extends StatelessWidget {
  final double? lat;
  final double? lng;
  const MapViewPage({
    super.key,
    this.lat,
    this.lng,
  });

  @override
  Widget build(BuildContext context) {
    return MapViewBody(
      lat: lat,
      lng: lng,
    );
  }
}
