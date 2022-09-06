import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:speedo/screens/driverfound.dart';
import 'package:speedo/screens/home.dart';

class CancelRide extends StatefulWidget {
  const CancelRide({Key key}) : super(key: key);

  @override
  State<CancelRide> createState() => _CancelRideState();
}

class _CancelRideState extends State<CancelRide> {
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
              initialChildSize: 0.6,
              minChildSize: 0.1,
              maxChildSize: 0.8,
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
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    width: 300,
                                    padding: EdgeInsets.fromLTRB(0, 20, 10, 5),
                                    alignment: Alignment.topLeft,
                                    child: Text('Please select the \n reason for cancellation:', style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),),
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
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
                                            checkedColor: Color(0xffFFC000),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'I don’t want to share',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          padding:EdgeInsets.fromLTRB(80,10,60,5),
                                          child: DottedLine(
                                            lineThickness: 0.5,
                                            dashGapLength: 1,
                                          )),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 40,
                                          ),
                                          RoundCheckBox(
                                            onTap: (selected) {},
                                            size: 30,
                                            uncheckedColor: Colors.white,
                                            checkedColor: Color(0xffFFC000),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Could not contact the driver',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          padding:EdgeInsets.fromLTRB(80,10,60,5),
                                          child: DottedLine(
                                            lineThickness: 0.5,
                                            dashGapLength: 1,
                                          )),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 40,
                                          ),
                                          RoundCheckBox(
                                            onTap: (selected) {},
                                            size: 30,
                                            uncheckedColor: Colors.white,
                                            checkedColor: Color(0xffFFC000),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Driver is late',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          padding:EdgeInsets.fromLTRB(80,10,60,5),
                                          child: DottedLine(
                                            lineThickness: 0.5,
                                            dashGapLength: 1,
                                          )),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 40,
                                          ),
                                          RoundCheckBox(
                                            onTap: (selected) {},
                                            size: 30,
                                            uncheckedColor: Colors.white,
                                            checkedColor: Color(0xffFFC000),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'The price is not reasonable',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          padding:EdgeInsets.fromLTRB(80,10,60,5),
                                          child: DottedLine(
                                            lineThickness: 0.5,
                                            dashGapLength: 1,
                                          )),
                                      Row(
                                        children: <Widget>[
                                          SizedBox(
                                            width: 40,
                                          ),
                                          RoundCheckBox(
                                            onTap: (selected) {},
                                            size: 30,
                                            uncheckedColor: Colors.white,
                                            checkedColor: Color(0xffFFC000),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Pickup address is incorrect',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          padding:EdgeInsets.fromLTRB(80,10,60,30),
                                          child: DottedLine(
                                            lineThickness: 0.5,
                                            dashGapLength: 1,
                                          )),
                                    ],
                                  )),
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
                                      child: Text("Submit",
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
