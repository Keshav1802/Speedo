import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speedo/screens/driverfound.dart';
import 'package:speedo/screens/home.dart';

class DestSelect2 extends StatefulWidget {
  const DestSelect2({Key key}) : super(key: key);

  @override
  State<DestSelect2> createState() => _DestSelect2State();
}

class _DestSelect2State extends State<DestSelect2> {
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
          initialCameraPosition:_kGooglePlex,
        ),
          Container(
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.1,
              maxChildSize: 0.4,
              builder: (BuildContext context, ScrollController scrollController) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,0),
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
                                    icon:
                                        Image.asset('assets/images/img_10.png')),
                                alignment: Alignment.topCenter,
                              ),
                              Container(
                                    height: 70,
                                    width: 300,
                                    padding: EdgeInsets.fromLTRB(0, 30, 10, 5),
                                    alignment: Alignment.topLeft,
                                    child: Text('Destination Location', style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),),
                                  ),
                              Container(
                                height:90,
                                width:350,
                                child: ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: List.generate(1, (index) {
                                      return ListTile(
                                        leading:  CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          radius: 20,
                                          child: const Icon(Icons.location_on,color: Colors.white,),
                                        ),
                                        // const Icon(Icons.location_on,color: Colors.blue,),
                                        title: Text('No 64, Kings Cross Underground Station, KZF67T'),
                                        subtitle: Text("M.P"),
                                      );
                                    }),
                                  ),

                              ),
                              Container(
                                height:60,
                                width:300,
                                child:ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      primary: Color(0xff212529),
                                      shape: const StadiumBorder(),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DriverFound()),
                                      );
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 130,
                                      child: Text("Continue",
                                        style: TextStyle(fontSize: 30),),)
                                ),
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
                      Container(
                        height: 100,
                        width: 250,
                        alignment: Alignment.center,
                        child: Text(
                          'Select Address',
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
