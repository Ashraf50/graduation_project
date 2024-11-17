import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/search_textfield.dart';
import 'package:graduation_project/core/widget/show_snackbar.dart';
import 'package:graduation_project/feature/map/presentation/view/widget/error_dialog.dart';
import 'package:graduation_project/feature/map/presentation/view_model/cubit/suggestion_places_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import '../../view_model/bloc/map_bloc.dart';
import '../../view_model/bloc/map_event.dart';
import '../../view_model/bloc/map_state.dart';
import 'zoom_button.dart';

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
      create: (context) => SuggestionPlacesCubit(),
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
              clipBehavior: Clip.none,
              children: [
                GoogleMap(
                  initialCameraPosition: state.cameraPosition,
                  zoomControlsEnabled: false,
                  markers: state.markers,
                  circles: state.circle,
                  onMapCreated: (controller) {
                    mapController = controller;
                    theme.isDarkTheme
                        ? initMapStyle(controller, true, context)
                        : initMapStyle(controller, false, context);
                  },
                ),
                ZoomButton(
                  icon: Icons.add,
                  posButton: 190,
                  onTap: () {
                    mapController?.animateCamera(CameraUpdate.zoomIn());
                  },
                ),
                ZoomButton(
                  icon: Icons.remove,
                  posButton: 155,
                  onTap: () {
                    mapController?.animateCamera(CameraUpdate.zoomOut());
                  },
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.20,
                  minChildSize: 0.20,
                  maxChildSize: 0.75,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: theme.isDarkTheme
                            ? Color(0xff242F3E)
                            : AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Divider(
                              thickness: 7,
                              color: AppColors.grey,
                              indent: 160,
                              endIndent: 160,
                            ),
                            SizedBox(height: 10),
                            SearchTextField(
                              hintText: S.of(context).search_here,
                              radius: 20,
                              cursorColor: theme.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                              focusedColor: Colors.grey,
                              enabledColor: Colors.grey,
                              suffixIcon: const Icon(Icons.search),
                              controller: searchController,
                              onChange: (query) {
                                if (query.isNotEmpty) {
                                  context
                                      .read<SuggestionPlacesCubit>()
                                      .fetchSuggestions(
                                        query,
                                      );
                                }
                              },
                              onSubmitted: (query) {
                                if (query.isNotEmpty) {
                                  context
                                      .read<MapBloc>()
                                      .add(SearchLocation(query: query));
                                }
                              },
                            ),
                            BlocBuilder<SuggestionPlacesCubit,
                                SuggestionPlacesState>(
                              builder: (context, state) {
                                if (state is SuggestionPlacesSuccess) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: state.suggestions.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(state.suggestions[index]),
                                      );
                                    },
                                  );
                                } else if (state is SuggestionPlacesFailure) {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    showSnackbar(context, state.errMessage);
                                  });
                                } else if (state is SuggestionPlacesLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return Text("");
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
