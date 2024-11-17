import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/search_textfield.dart';
import 'package:graduation_project/feature/map/presentation/view/widget/error_dialog.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../../data/utils/location_service.dart';
import '../../view_model/bloc/map_bloc.dart';
import '../../view_model/bloc/map_event.dart';
import '../../view_model/bloc/map_state.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  _CustomGoogleMapState createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  final TextEditingController searchController = TextEditingController();

  late GoogleMapController? mapController;

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
            return Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: state.cameraPosition,
                  markers: state.markers,
                  circles: state.circle,
                  onMapCreated: (controller) {
                    mapController = controller;
                    theme.isDarkTheme
                        ? initMapStyle(controller, true, context)
                        : initMapStyle(controller, false, context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchTextField(
                    hintText: "search here...",
                    radius: 20,
                    cursorColor:
                        theme.isDarkTheme ? Colors.white : Colors.black,
                    focusedColor:
                        theme.isDarkTheme ? Color(0xff242F3E) : Colors.white,
                    enabledColor:
                        theme.isDarkTheme ? Color(0xff242F3E) : Colors.white,
                    filled: true,
                    fillColor:
                        theme.isDarkTheme ? Color(0xff242F3E) : Colors.white,
                    suffixIcon: Icon(Icons.search),
                    controller: searchController,
                    onSubmitted: (p0) {
                      String query = searchController.text.trim();
                      if (query.isNotEmpty) {
                        context
                            .read<MapBloc>()
                            .add(SearchLocation(query: query));
                      }
                    },
                  ),
                ),
              ],
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
              case "search_error":
                errorMessage = 'Error searching location';
                break;
              default:
                errorMessage = S.of(context).error_location;
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showLocationErrorDialog(
                context,
                errorMessage,
                theme,
                () {
                  context.pop();
                  context.read<MapBloc>().add(LoadMap());
                },
              );
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
