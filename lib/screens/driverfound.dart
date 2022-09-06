import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speedo/routes/routes.dart';
import 'package:speedo/screens/cancel_ride.dart';
import 'package:speedo/screens/home.dart';
import 'package:speedo/widgets/auth/forgotpassword_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverFound extends StatefulWidget {
  const DriverFound({Key key}) : super(key: key);

  @override
  State<DriverFound> createState() => _DriverFoundState();
}

class _DriverFoundState extends State<DriverFound> {
  bool expanded = false;
  bool couponexpanded=false;
  String _coupon;
  static const String route = '/homescreen"';
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.6139, 77.2090),
    zoom: 14.4746,
  );
  Set<Marker> _markers = Set();
  GoogleMapController mapController;

  Future<void> dialNumber(
      {@required String phoneNumber, BuildContext context}) async {
    final url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Unable to call $phoneNumber"),
          backgroundColor: Colors.green,
        ),
      );
    }

    return;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeWidget()),
              (Route<dynamic> route) => true,
        );
        // Navigator.pop(context, true);
        //we need to return a future
        // return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          key: _scaffoldState,
          body: Stack(children: [
            GoogleMap(
              mapType: MapType.terrain,
              myLocationEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              zoomControlsEnabled: true,
              markers: _markers,
              //markers: _markers,
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
                minChildSize: 0.1,
                maxChildSize: 0.8,
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
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey, //New
                                              blurRadius: 25.0,
                                              offset: Offset(0, -1))
                                        ],
                                        color: Color(0xffFFFFFF),
                                        border: Border.all(
                                          color: Color(0xffFFFFFF),
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: ClipOval(
                                        child: Material(
                                          color: Colors.blue,
                                          child: Ink.image(
                                            image: AssetImage(
                                                'assets/images/img_18.png'),
                                            fit: BoxFit.cover,
                                            width: 70,
                                            height: 70,
                                            child: InkWell(onTap: () {}),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Container(
                                      height: 70,
                                      width: 70,
                                      child: IconButton(
                                        icon: Image.asset(
                                            'assets/images/img_19.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 90,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xffD5DDE0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      child: Text('HS785K',
                                          style: TextStyle(fontSize: 18),
                                          textAlign: TextAlign.center),
                                    ),
                                    // ElevatedButton(onPressed: (){}, child: Text('HS785K'))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 35,
                                    ),
                                    Container(
                                      child: Text(
                                        'Ritik Mishra',
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 150,
                                      child: Text(
                                        'Volkswagen Jetta',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Container(
                                      child: Text(
                                        'Arriving In :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '2 min',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 70,
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey, //New
                                            blurRadius: 25.0,
                                            offset: Offset(-5, -5))
                                      ]),
                                      child: SwipeButton.expand(
                                        thumb: Material(
                                          elevation: 20,
                                          child: IconButton(
                                            icon: Image.asset(
                                                'assets/images/img_21.png'),
                                            color: Colors.grey,
                                            iconSize: 50,
                                          ),
                                        ),
                                        child: Text(
                                          "         Contact Driver",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        activeThumbColor: Colors.white,
                                        activeTrackColor: Color(0xff1152FD),
                                        onSwipe: () {
                                          dialNumber(phoneNumber: "1234567890");
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      height: 120,
                                      width: 100,
                                      child: IconButton(
                                        icon: Image.asset(
                                          'assets/images/img_20.png',
                                        ),
                                        iconSize: 120,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CancelRide()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
                                            child: Column(
                                              children: [
                                                // SizedBox(height: 80,),
                                               Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 40, 0, 0),
                                                          child: Container(
                                                            height: 60,
                                                            width: 50,
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Text(
                                                              '11:24',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.fromLTRB(
                                                                  0, 25, 0, 0),
                                                          height: 60,
                                                          width: 50,
                                                          alignment:
                                                              Alignment.topCenter,
                                                          child: Text(
                                                            '11:38',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                              ],
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
                                                  '1, Thrale Street, London, SE19HW, UK',
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
                                                  'Ealing Broadway Shopping Centre, London, W55JY, UK',
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
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 350,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF7F8F9),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 6.0,
                                        ),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          'Payment Method',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                      ),
                                      Container(
                                        child: IconButton(
                                          visualDensity:
                                              VisualDensity.comfortable,
                                          iconSize: 20,
                                          icon: Icon(expanded
                                              ? Icons.arrow_drop_down
                                              : Icons.arrow_forward_ios),
                                          onPressed: () => setState(() {
                                            expanded = !expanded;
                                          }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                AnimatedContainer(
                                  padding: EdgeInsets.all(20),
                                  duration: const Duration(milliseconds: 200),
                                  height: expanded ? 250 : 0,
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF7F8F9),
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
                                        Container(
                                          height:50,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0.0, 0.0),
                                                  blurRadius: 1.0,
                                                ),
                                              ]),
                                          child: Row(
                                            children: <Widget>[
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      'assets/images/img_22.png')),
                                              SizedBox(width: 10,),
                                              Text('**** 8295'),
                                              SizedBox(
                                                width: 130,
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.arrow_forward_ios,size: 15,),)
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height:50,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0.0, 0.0),
                                                  blurRadius: 1.0,
                                                ),
                                              ]),
                                          child: Row(
                                            children: <Widget>[
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      'assets/images/img_23.png')),
                                              SizedBox(width: 10,),
                                              Text('**** 3704'),
                                              SizedBox(
                                                width: 130,
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.arrow_forward_ios,size: 15,),)
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          height:50,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0.0, 0.0),
                                                  blurRadius: 1.0,
                                                ),
                                              ]),
                                          child: Row(
                                            children: <Widget>[
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Image.asset(
                                                      'assets/images/img_24.png')),
                                              SizedBox(width: 10,),
                                              Text('Cash'),
                                              SizedBox(
                                                width: 160,
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.arrow_forward_ios,size: 15,),)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    // height: 120,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 350,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF7F8F9),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 6.0,
                                        ),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        child: Text(
                                          'Enter Coupon Code',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 140,
                                      ),
                                      Container(
                                        child: IconButton(
                                          visualDensity:
                                          VisualDensity.comfortable,
                                          iconSize: 20,
                                          icon: Icon(couponexpanded
                                              ? Icons.arrow_drop_down
                                              : Icons.arrow_forward_ios),
                                          onPressed: () => setState(() {
                                            couponexpanded = !couponexpanded;
                                          }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                AnimatedContainer(
                                  padding: EdgeInsets.all(20),
                                  duration: const Duration(milliseconds: 200),
                                  height: couponexpanded ? 130 : 0,
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Color(0xffF7F8F9),
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
                                        TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          style: const TextStyle(color: Colors.black),
                                          // validator: (input) {
                                          //   print("value:" + input.toString());
                                          //   if(input.isEmpty){
                                          //     return "Email can't be empty";
                                          //   }
                                          //   else if (!isValidEmail(input)) {
                                          //     return 'Enter a valid  email';
                                          //   }
                                          //   return null;
                                          // },
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide:
                                                const BorderSide(color: Colors.transparent),
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                            contentPadding: const EdgeInsets.all(15),
                                            // prefixIcon: const Icon(
                                            //   Icons.mail_outline,
                                            //   color: Color(0xff804ed1),
                                            // ),
                                            filled: true,
                                            fillColor:  Colors.white,
                                            //focusColor: Colors.red,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                const BorderSide(color: Colors.white),
                                                borderRadius:
                                                BorderRadius.circular(30)),
                                            // labelText: 'EMAIL',
                                            // labelStyle: const TextStyle(color: Colors.black),
                                          ),
                                          onSaved: (input) => _coupon = input,
                                        ),
                                        // Container(
                                        //   height:50,
                                        //   padding: EdgeInsets.all(5),
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(15)),
                                        //       boxShadow: const [
                                        //         BoxShadow(
                                        //           color: Colors.grey,
                                        //           offset: Offset(0.0, 0.0),
                                        //           blurRadius: 1.0,
                                        //         ),
                                        //       ]),
                                        //   child: Row(
                                        //     children: <Widget>[
                                        //       IconButton(
                                        //           onPressed: () {},
                                        //           icon: Image.asset(
                                        //               'assets/images/img_22.png')),
                                        //       SizedBox(width: 10,),
                                        //       Text('**** 8295'),
                                        //       SizedBox(
                                        //         width: 130,
                                        //       ),
                                        //       IconButton(
                                        //         onPressed: () {},
                                        //         icon: Icon(
                                        //           Icons.arrow_forward_ios,size: 15,),)
                                        //     ],
                                        //   ),
                                        // ),
                                        // SizedBox(height: 10,),
                                        // Container(
                                        //   height:50,
                                        //   padding: EdgeInsets.all(5),
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(15)),
                                        //       boxShadow: const [
                                        //         BoxShadow(
                                        //           color: Colors.grey,
                                        //           offset: Offset(0.0, 0.0),
                                        //           blurRadius: 1.0,
                                        //         ),
                                        //       ]),
                                        //   child: Row(
                                        //     children: <Widget>[
                                        //       IconButton(
                                        //           onPressed: () {},
                                        //           icon: Image.asset(
                                        //               'assets/images/img_23.png')),
                                        //       SizedBox(width: 10,),
                                        //       Text('**** 3704'),
                                        //       SizedBox(
                                        //         width: 130,
                                        //       ),
                                        //       IconButton(
                                        //         onPressed: () {},
                                        //         icon: Icon(
                                        //           Icons.arrow_forward_ios,size: 15,),)
                                        //     ],
                                        //   ),
                                        // ),
                                        // SizedBox(height: 10,),
                                        // Container(
                                        //   height:50,
                                        //   padding: EdgeInsets.all(5),
                                        //   decoration: BoxDecoration(
                                        //       color: Colors.white,
                                        //       borderRadius: BorderRadius.all(
                                        //           Radius.circular(15)),
                                        //       boxShadow: const [
                                        //         BoxShadow(
                                        //           color: Colors.grey,
                                        //           offset: Offset(0.0, 0.0),
                                        //           blurRadius: 1.0,
                                        //         ),
                                        //       ]),
                                        //   child: Row(
                                        //     children: <Widget>[
                                        //       IconButton(
                                        //           onPressed: () {},
                                        //           icon: Image.asset(
                                        //               'assets/images/img_24.png')),
                                        //       SizedBox(width: 10,),
                                        //       Text('Cash'),
                                        //       SizedBox(
                                        //         width: 160,
                                        //       ),
                                        //       IconButton(
                                        //         onPressed: () {},
                                        //         icon: Icon(
                                        //           Icons.arrow_forward_ios,size: 15,),)
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    // height: 120,
                                  ),
                                ),

                                // Container(
                                //   // child:
                                // )
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
            //   ],
            // ),
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
                              // Navigator.pushNamedAndRemoveUntil(context, Routes.homescreen, (route) => false);
                              // Navigator.pushNamed(context, Routes.homescreen);

                              Navigator.push(
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
                            'Driver Found',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    )))
          ])),
    );
  }
}
