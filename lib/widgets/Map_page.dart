import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:car_uber/screens/global/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map_Page extends StatefulWidget {
  Map_Page({super.key});

  @override
  State<Map_Page> createState() => _Map_PageState();
}

class _Map_PageState extends State<Map_Page> {
  //declaring the Google map variables
  final Completer<GoogleMapController> googleMapCompleteContoller =
      Completer<GoogleMapController>();

  GoogleMapController? controllerGoogleMap;

  Position? currentPostionOfUser;

//retreving the json format map style to app
  void updateMapTheme(GoogleMapController controller) {
    getJsonFileFromThemes("themes/standrad_style.json")
        .then((value) => setGoogleMapStyle(value, controller));
  }

  Future<String> getJsonFileFromThemes(String mapstylePath) async {
    ByteData byteData = await rootBundle.load(mapstylePath);
    var list = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return utf8.decode(list);
  }

//Google Map Style
  setGoogleMapStyle(String googleMapStyle, GoogleMapController controller) {
    controller.setMapStyle(googleMapStyle);
  }

  //Get User Current Location
  getCurrentLiveLocationOfUser() async {
    Position positionOfUser = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPostionOfUser = positionOfUser;
    LatLng postionOfUserInLatlng =
        LatLng(currentPostionOfUser!.latitude, currentPostionOfUser!.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: postionOfUserInLatlng, zoom: 15);
    controllerGoogleMap!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          initialCameraPosition: GooglePlexInitialPostion,
          onMapCreated: (GoogleMapController mapController) {
            controllerGoogleMap = mapController;
            updateMapTheme(controllerGoogleMap!);
            googleMapCompleteContoller.complete(controllerGoogleMap);

            getCurrentLiveLocationOfUser();
          },
        )
      ],
    ));
  }
}
