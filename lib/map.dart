import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import './choisirUnParking/ChoisirUnParking.dart';
import 'choisirUnParking/ChoisirUnParking.dart';

class MapSample extends StatefulWidget {
  @override
  // const MapSample({
  //   Key key,
  //   this.lat,
  //   this.long,
  // }) : super(key: key);

  // final MapSample lat;
  // final MapSample long;
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  bool servicestatus = false;
  bool haspermission = false;
  LocationPermission permission;
  Position position;
  //=Position(longitude: 3.05997, 36.7762, timestamp: null, accuracy: null, altitude: null, heading: null, speed: null, speedAccuracy: null);
  double long = 3.05997, lat = 36.7762;
  StreamSubscription<Position> positionStream;
  final key = 'AIzaSyAPESixyiDS-Ag-_tYl19IxqiMaK-PAANY';

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    //check if GPS is enabled:
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      //check Location Permission or Request Location Permission:
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    //get the current GPS locations such as Longitude and Latitude
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    long = position.longitude;
    lat = position.latitude;
    setState(() {
      //refresh UI
    });
//How to Listen to GPS Location: Longitude and Latitude Change Stream:

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      long = position.longitude;
      lat = position.latitude;

      setState(() {
        //refresh UI on update
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        if (long != 3.05997)
          Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                markers: {
                  Marker(
                    markerId: MarkerId('_kGooglePlex'),
                    infoWindow: InfoWindow(title: 'Google Plex'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(position.latitude, position.longitude),
                  )
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14.4746,
                ),
              ))
        else
          Text("wait"),
        ParkingsInformation()
      ],
    )));
  }
}
