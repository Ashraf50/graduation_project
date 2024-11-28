import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/search_textfield.dart';
import 'package:graduation_project/feature/map/data/model/places_model/places_model.dart';
import 'package:graduation_project/feature/map/data/repo/map_repo_impl.dart';
import 'package:graduation_project/feature/map/presentation/view/widget/error_dialog.dart';
import 'package:graduation_project/feature/map/presentation/view/widget/place_details.dart';
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
  CustomGoogleMapState createState() => CustomGoogleMapState();
}

class CustomGoogleMapState extends State<CustomGoogleMap> {
  final TextEditingController searchController = TextEditingController();
  late GoogleMapController? mapController;
  Timer? debounce;
  bool isSelected = false;
  late PlacesModel selectedPlace;
  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => SuggestionPlacesCubit(MapRepoImpl()),
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
                  polylines: state.polyLines,
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
                      ),
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          SliverAppBar(
                            backgroundColor: theme.isDarkTheme
                                ? Color(0xff242F3E)
                                : AppColors.white,
                            pinned: true,
                            elevation: 0,
                            expandedHeight: 70,
                            automaticallyImplyLeading: false,
                            scrolledUnderElevation: 0,
                            flexibleSpace: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
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
                                            .fetchAllSuggestionPlaces(
                                                query: query);
                                        isSelected = false;
                                        setState(() {});
                                      } else {
                                        context
                                            .read<SuggestionPlacesCubit>()
                                            .clearSuggestionPlaces();
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
                                ],
                              ),
                            ),
                          ),
                          SliverFillRemaining(
                            child: BlocBuilder<SuggestionPlacesCubit,
                                SuggestionPlacesState>(
                              builder: (context, state) {
                                if (state is SuggestionPlacesSuccess) {
                                  return Scrollbar(
                                    controller: scrollController,
                                    child: isSelected
                                        ? PlaceDetails(
                                            place: selectedPlace,
                                          )
                                        : ListView.builder(
                                            itemCount:
                                                state.suggestionPlaces.length,
                                            itemBuilder: (context, index) {
                                              final suggestion =
                                                  state.suggestionPlaces[index];
                                              return ListTile(
                                                title: Text(suggestion.title!),
                                                subtitle: Text(
                                                    suggestion.address!.label!),
                                                leading: Icon(
                                                  Icons.location_on,
                                                  color: theme.isDarkTheme
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                                onTap: () {
                                                  context.read<MapBloc>().add(
                                                        CreateRoute(
                                                          endLat: suggestion
                                                              .position!.lat!,
                                                          endLon: suggestion
                                                              .position!.lng!,
                                                          means: 'driving',
                                                        ),
                                                      );
                                                  setState(() {
                                                    isSelected = true;
                                                    selectedPlace = suggestion;
                                                  });
                                                },
                                              );
                                            },
                                          ),
                                  );
                                } else if (state is SuggestionPlacesFailure) {
                                  Center(
                                    child: Text(
                                      'No suggestion',
                                      style: AppStyles.textStyle18black,
                                    ),
                                  );
                                } else if (state is SuggestionPlacesLoading) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                return Text('');
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is MapError) {
            String errorMessage = '';
            switch (state.errMessage) {
              case 'enable_location':
                errorMessage = S.of(context).enable_location;
                break;
              case 'location_access':
                errorMessage = S.of(context).location_access;
                break;
              case 'search_error':
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
      .loadString('assets/map_style/night_map_style.json');
  var lightMapStyle = await DefaultAssetBundle.of(context)
      .loadString('assets/map_style/light_map_style.json');
  if (isDarkTheme) {
    controller.setMapStyle(nightMapStyle);
  } else {
    controller.setMapStyle(lightMapStyle);
  }
}
