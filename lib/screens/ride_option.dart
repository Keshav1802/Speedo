import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:speedo/auth/forgotpassword.dart';
import 'package:speedo/screens/home.dart';

class RideOptions extends StatefulWidget {
  const RideOptions({Key key}) : super(key: key);

  @override
  State<RideOptions> createState() => _RideOptionsState();
}

class _RideOptionsState extends State<RideOptions> {
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.6139, 77.2090),
    zoom: 14.4746,
  );
  Set<Marker> _markers = Set();
  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        body: Stack(children: [
          GoogleMap(
            mapType: MapType.terrain,
            myLocationEnabled: false,
            mapToolbarEnabled: false,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            zoomControlsEnabled: true,
            markers: _markers, //markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              // mapController.setMapStyle(_mapStyle);
              setState(() {
                // _markers.add(Marker(
                //     markerId: MarkerId('SampleMarker'),
                //     position: LatLng(45.521563, -122.677433),
                //     icon: partyMarkerIcon));
                //   _markers.add(Marker(
                //       markerId: MarkerId("SampleMarkerTwo"),
                //       position: LatLng(45.531563, -122.687433),
                //       icon: concertMarkerIcon));
              });
            },
            initialCameraPosition: _kGooglePlex,
          ),
          Container(
            child: DraggableScrollableSheet(
              initialChildSize: 0.48,
              minChildSize: 0.48,
              maxChildSize: 0.48,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    child: ListView.builder(
                        itemCount: 1,
                        controller: scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 20,
                                width: 60,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'assets/images/img_10.png')),
                                alignment: Alignment.topCenter,
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 70,
                                    width: 300,
                                    padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Someone else taking this ride?',
                                      style: TextStyle(
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 70,
                                width: 300,
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Choose a contact from your phone book so that they also get driver numberr, '
                                  'vehicle details and ride OTP via SMS.',
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                  child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 40,
                                      ),
                                      RoundCheckBox(
                                        onTap: (selected) {},
                                        size: 30,
                                        uncheckedColor: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Self',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 30,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Image.asset(
                                              'assets/images/img_17.png')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const ForgotPasswordScreen()));
                                        },
                                        child: const Text(
                                          'Choose Contact',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                height: 60,
                                width: 300,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      primary: Color(0xff212529),
                                      shape: const StadiumBorder(),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeWidget()),
                                      );
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 130,
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    )),
                              )
                            ],
                          );
                        }),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
              child: Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeWidget()));
                          },
                          child: const Icon(Icons.arrow_back_ios_new,
                              color: Colors.black),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(5),
                            primary: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )))
        ]));
  }
}
