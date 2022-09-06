import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speedo/layout/kpiwidget.dart';
import 'package:speedo/routes/routes.dart';
import 'package:speedo/screens/driverfound.dart';
import 'package:speedo/screens/home.dart';

class SearchDriverBike extends StatefulWidget {
  const SearchDriverBike({Key key}) : super(key: key);

  @override
  State<SearchDriverBike> createState() => _SearchDriverBikeState();
}

class _SearchDriverBikeState extends State<SearchDriverBike> {
  static const String route = '/driverfound';
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  bool _hasBeenPressed = false;
  Timer _timer;
  Color _iconColor = Colors.white;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.6139, 77.2090),
    zoom: 14.4746,
  );
  Set<Marker> _markers = Set();
  GoogleMapController mapController;
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(const Duration(seconds: 2), _navigatetodriverfound);
  }

  void _navigatetodriverfound() {
    _timer?.cancel();
    _timer = null;

    // Popping all routes and pushing welcome screen
    // Navigator.pushReplacement(context,Routes.driverfound
    //     );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => DriverFound()),
          (Route<dynamic> route) => false,
    );
    // Navigator.pushNamed(context,Routes.driverfound);
  // _navigatorKey.currentState.push(MaterialPageRoute(builder: (BuildContext context) => HomeWidget()));
  //   _navigatorKey.currentState.pushNamedAndRemoveUntil(Routes.homescreen, (_) => false);
  }
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
            zoomControlsEnabled: false,
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
              initialChildSize: 0.6,
              minChildSize: 0.6,
              maxChildSize: 0.6,
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
                                height: 30,
                                width: 60,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'assets/images/img_10.png')),
                                alignment: Alignment.topCenter,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  KPIWidget(
                                    name: "Bike",
                                    child: InkWell(
                                      focusColor: _hasBeenPressed
                                          ? Colors.yellowAccent
                                          : Colors.white,
                                      child: IconButton(
                                        enableFeedback: true,
                                        color: _iconColor,
                                        focusColor: Color(0xffFFC000),
                                        hoverColor: Color(0xffFFC000),
                                        splashColor: Color(0xffFFC000),
                                        highlightColor: Color(0xffFFC000),
                                        icon: Image.asset(
                                          'assets/images/img_11.png',
                                        ),
                                        onPressed: () {
                                          HapticFeedback.heavyImpact();
                                          setState(() {
                                            if (_iconColor == Colors.white) {
                                              _iconColor = Colors.yellowAccent;
                                            } else {
                                              _iconColor = Colors.white;
                                            }
                                          });
                                          // setState(() {
                                          //   sta = 1;
                                          // });
                                          // Navigator.pushReplacement(context,
                                          //     MaterialPageRoute(builder: (context) => const LoginWithPhone()));
                                          print("tapped");
                                        },
                                      ),
                                    ),
                                  ),
                                  KPIWidget(
                                    name: "Cab",
                                    child: IconButton(
                                      enableFeedback: true,
                                      focusColor: Color(0xffFFC000),
                                      hoverColor: Color(0xffFFC000),
                                      splashColor: Color(0xffFFC000),
                                      highlightColor: Color(0xffFFC000),
                                      icon: Image.asset(
                                          'assets/images/img_7.png'),
                                      onPressed: () {
                                        // setState(() {
                                        //   sta = 2;
                                        // });
                                        // Navigator.pushReplacement(context,
                                        //     MaterialPageRoute(builder: (context) => const LoginWithPhone()));
                                      },
                                    ),
                                  ),
                                  KPIWidget(
                                    name: "Auto",
                                    child: IconButton(
                                      enableFeedback: true,
                                      focusColor: Color(0xffFFC000),
                                      hoverColor: Color(0xffFFC000),
                                      splashColor: Color(0xffFFC000),
                                      highlightColor: Color(0xffFFC000),
                                      icon: Image.asset(
                                          'assets/images/img_8.png'),
                                      onPressed: () {
                                        // setState(() {
                                        //   sta = 3;
                                        // });
                                        // Navigator.pushReplacement(context,
                                        //     MaterialPageRoute(builder: (context) => const LoginWithPhone()));
                                      },
                                    ),
                                  ),
                                  KPIWidget(
                                    name: "Package \n Delivery",
                                    child: IconButton(
                                      enableFeedback: true,
                                      focusColor: Color(0xffFFC000),
                                      hoverColor: Color(0xffFFC000),
                                      splashColor: Color(0xffFFC000),
                                      highlightColor: Color(0xffFFC000),
                                      icon: Image.asset(
                                          'assets/images/img_9.png'),
                                      onPressed: () {
                                        // setState(() {
                                        //   sta = 4;
                                        // });
                                        // Navigator.pushReplacement(context,
                                        //     MaterialPageRoute(builder: (context) => const LoginWithPhone()));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                width: 350,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.0),
                                        blurRadius: 6.0,
                                      ),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                              height: 80,
                                              width: 50,
                                              alignment: Alignment.topCenter,
                                              child: Text(
                                                '11:24',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14),
                                              ),
                                            ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 30, 4, 20),
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/img_12.png"),
                                            height: 120,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              // padding: EdgeInsets.fromLTRB(5, 30, 5, 30),
                                              // height: 50,
                                              width: 200,
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '1, Thrale Street, Indore SE19HW, MP',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 45,
                                            ),
                                            Container(
                                              // height: 50,
                                              width: 200,
                                              child: Text(
                                                'Ealing Broadway Shopping Centre, Indore, W55JY, MP',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                child: Container(
                                  height: 40,
                                  width: 200,
                                  alignment:Alignment.center,
                                  child: Text(
                                    'Searching for a driver',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
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
                          child: const Icon(Icons.cancel_outlined,
                              color: Colors.black),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(5),
                            primary: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 250,
                        alignment: Alignment.center,
                        child: Text(
                          'Searching Driver',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  )))
        ]));
  }
}
