import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/map/presentation/view/widget/error_dialog.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../data/utils/location_service.dart';
import '../../view_model/bloc/map_bloc.dart';
import '../../view_model/bloc/map_event.dart';
import '../../view_model/bloc/map_state.dart';

class CustomGoogleMap extends StatelessWidget {
  const CustomGoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => MapBloc(LocationService())..add(LoadMap()),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          if (state is MapLoading) {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: AppColors.primaryColor,
                size: 100,
              ),
            );
          } else if (state is MapLoadingSuccess) {
            return GoogleMap(
              initialCameraPosition: state.cameraPosition,
              markers: state.markers,
              onMapCreated: (controller) {
                theme.isDarkTheme
                    ? initMapStyle(controller, true, context)
                    : initMapStyle(controller, false, context);
              },
            );
          } else if (state is MapError) {
            String errorMessage = '';
            switch (state.errMessage) {
              case "enable_location":
                errorMessage = S.of(context).enable_location;
                break;
              case "location_access":
                errorMessage = S.of(context).location_access;
                break;
              case "error_location":
              default:
                errorMessage = S.of(context).error_location;
            }
            final mapBloc = context.read<MapBloc>();
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showLocationErrorDialog(context, errorMessage, mapBloc, theme);
            });
          }
          return const SizedBox();
        },
      ),
    );
  }

  void initMapStyle(GoogleMapController controller, bool isDarkTheme,
      BuildContext context) async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style/night_map_style.json");
    var lightMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style/light_map_style.json");
    if (isDarkTheme) {
      controller.setMapStyle(nightMapStyle);
    } else {
      controller.setMapStyle(lightMapStyle);
    }
  }
}
