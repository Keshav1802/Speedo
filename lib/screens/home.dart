import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speedo/layout/draggablesection.dart';
import 'package:speedo/model/place_item_res.dart';
import 'package:speedo/routes/routes.dart';
import 'package:speedo/screens/home_drawer.dart';
import '../../utils/map_util.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final Completer<GoogleMapController> _completer = Completer();
  MapUtil mapUtil = MapUtil();
  Location _locationService = Location();
   LatLng currentLocation;
  LatLng _center = const LatLng(28.6139, 77.2090);
  bool _permission = false;
  Set<Marker> _markers = Set();
  List<Polyline> routes = <Polyline>[];
  bool done = false;
   String error;
  double top = 0.0;
  double initialTop = 0.0;
  GoogleMapController mapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.6139, 77.2090),
    zoom: 14.4746,
  );

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        elevation: 24,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: new Text('Are you sure?',style: TextStyle(fontWeight: FontWeight.w500),),
        content: new Text('Do you want to exit the App',style: TextStyle(fontWeight: FontWeight.w400)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No',style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes',style: TextStyle(fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    )) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    final baseTop = MediaQuery.of(context).size.height * 0.6;
    GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        // bottomSheet: Container(
        //   height: 400,
        //   decoration: const BoxDecoration(color: Colors.black),
        //   child: Column(),
        // ),
        // drawer: Drawer(
        //   child: HomeDrawer(),
        // ),
        body: Stack(
          children: <Widget>[
              DraggableSection(),
          ],
        ),
      ),
    );
  }
}
