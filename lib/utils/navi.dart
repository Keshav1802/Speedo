// import 'package:date_time_picker/date_time_picker.dart';
// import "package:flutter/material.dart";
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:speedo/screens/dest_select2.dart';
// import 'package:menu_button/menu_button.dart';
// import 'package:speedo/screens/searchdriverbike.dart';
//
// String _valueChanged3 = '';
// String _valueToValidate3 = '';
// String _valueSaved3 = '';
// String _valueChanged4 = '';
// String _valueToValidate4 = '';
// String _valueSaved4 = '';
// String selectedKey='';
// String _currentLocation = "";
//
// final Widget normalChildButton = SizedBox(
//   width: 200,
//   height: 50,
//   child: Padding(
//     padding: const EdgeInsets.only(left: 16, right: 0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Flexible(
//             child: Text(selectedKey, overflow: TextOverflow.ellipsis)
//         ),
//         const SizedBox(
//           width: 10,
//           height: 40,
//           child: FittedBox(
//             fit: BoxFit.fill,
//             child: Icon(
//               Icons.arrow_drop_down,
//               color: Colors.grey,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// );
//
// Future<void> getLocationName(Position position) async {
//   List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
//   //print(placemarks);
//   Placemark place = placemarks[0];
//   // ignore: non_constant_identifier_names
//   var Address = ' ${place.locality}, ${place.country}';
//   //
//   // setState(() {
//   //   _currentLocation = Address;
//   // }
//   // );
// }
// class navi extends StatefulWidget {
//   const navi({Key key}) : super(key: key);
//
//   @override
//   State<navi> createState() => _naviState();
// }
//
// class _naviState extends State<navi> {
//   int sta=0;
//   @override
//   Widget build(BuildContext context) {
//       return naviList(context, sta);
//   }
//
//
//   @override
//   Widget naviList(BuildContext context, int sta) {
//     List<String> loca = ["Kanpur", "Lucknow", "Ayodhya", "Varanasi"];
//     List<String> titl = [
//       "Kings Cross Underground Statio...",
//       "83, Midwood St",
//       "67, Grand Central Pkwy",
//       "67, Grand Central Pkwy"
//     ];
//     List<String> vehicleimg = [
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_15.png?alt=media&token=c10265c0-9c1a-472f-9d00-cd42cd46f7d2",
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_16.png?alt=media&token=50d67bb6-b93f-4aa9-8afb-cef6af64ea1d",
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_16.png?alt=media&token=50d67bb6-b93f-4aa9-8afb-cef6af64ea1d"
//     ];
//     List<String> keys = [
//       'Upto 150',
//       'Upto 100',
//       'Upto 200',
//     ];
//     List<String> vehiclename = ["     Bike", "   Scooty", "Scooty EV"];
//     List<String> cabname = [
//       "      Mini",
//       "     Micro",
//       "Prime Sedan/\nSUV",
//       "     Prime XUV",
//       "        Cab EV"
//     ];
//     List<String> cabimg = [
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_17.png?alt=media&token=bd3eeaca-33ff-495a-970a-3ea0651a58a1",
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_18.png?alt=media&token=c19c6d01-98db-4a73-a145-d4c951774746",
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_21.png?alt=media&token=89384ba5-21eb-4f61-99e0-a563862176de",
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_20.png?alt=media&token=07bb7eed-cae3-4a5f-bdfd-e962e1d5dfe2",
//       "https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_20.png?alt=media&token=07bb7eed-cae3-4a5f-bdfd-e962e1d5dfe2"
//     ];
//     String address = "Delhi-NCR, Meerut Road (NH-58)";
//     List<String> cabprices = [
//       "    Rs 80 - Rs 130",
//       "     Rs 100 - Rs 150",
//       "     Rs 150 - Rs 200",
//       "Rs 200 - Rs 250",
//       "Rs 100 - Rs 130"
//     ];
//     List<String> cabcapacity = ["3", "3", "4", "5", "5"];
//     List<String> autoname = [
//       "Auto Petrol",
//       "Auto Diesel",
//       " Auto CNG",
//       "   Auto EV"
//     ];
//     List<String> autoprices = [
//       "    Rs 100 - Rs 200",
//       "     Rs 100 - Rs 200",
//       "     Rs 100 - Rs 200",
//       "Rs 80 - Rs 150"
//     ];
//     List<Widget> navi = [
//       Column(children: <Widget>[
//         Container(
//           width: 350,
//           height: 200,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   offset: Offset(0.0, 1.0),
//                   blurRadius: 6.0,
//                 ),
//               ]),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 30, 5, 20),
//                     child: Image(
//                       image: AssetImage("assets/images/img_12.png"),
//                       height: 120,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // padding: EdgeInsets.fromLTRB(5, 30, 5, 30),
//                         height: 60,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {
//                             // getLocationName(position);
//                           },
//                           child: TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: new InputDecoration(
//                               hintText: "24, Ocean avenue",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 90,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: "02, Sector Road",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               IntrinsicHeight(
//                 child: Row(
//                   children: <Widget>[
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.date,
//                         //dateMask: 'yyyy/MM/dd',
//                         // controller: _controller3,
//                         //initialValue: _initialValue,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                         icon: Icon(Icons.event),
//                         dateHintText: "Today",
//                         // onChanged: (val) => setState(() => _valueChanged3 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate3 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
//                       ),
//                     ),
//                     VerticalDivider(
//                       thickness: 2,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.time,
//                         timePickerEntryModeInput: true,
//                         //controller: _controller4,
//                         initialValue: '',
//                         //_initialValue,
//                         icon: Icon(Icons.access_time),
//                         timeHintText: "Time",
//                         use24HourFormat: false,
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) =>
//                         //     // setState(() => _valueChanged4 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate4 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           height: 50,
//           width: 250,
//           alignment: Alignment.center,
//           padding: EdgeInsets.fromLTRB(30, 10, 20, 0),
//           child: Row(
//             children: <Widget>[
//               Image(
//                 image: AssetImage("assets/images/img_13.png"),
//                 height: 40,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const DestSelect2()));
//                 },
//                 child: const Text(
//                   ' Show on a map',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Column(
//           children: [
//             Container(
//               height: 50,
//               width: 350,
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "RECENT",
//                 style: TextStyle(
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//             Container(
//               height: 300,
//               width: 380,
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: ListView(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.vertical,
//                       children: List.generate(4, (index) {
//                         return ListTile(
//                           leading: const Icon(Icons.location_on),
//                           title: Text(titl[index]),
//                           subtitle: Text("M.P"),
//                         );
//                       }),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       Column(children: <Widget>[
//         Container(
//           width: 350,
//           height: 220,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   offset: Offset(0.0, 1.0),
//                   blurRadius: 6.0,
//                 ),
//               ]),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 30, 5, 20),
//                     child: Image(
//                       image: AssetImage("assets/images/img_12.png"),
//                       height: 120,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // padding: EdgeInsets.fromLTRB(5, 30, 5, 30),
//                         height: 60,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: new InputDecoration(
//                               hintText: "24, Ocean avenue",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 90,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: "02, Sector Road",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               IntrinsicHeight(
//                 child: Row(
//                   children: <Widget>[
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.date,
//                         //dateMask: 'yyyy/MM/dd',
//                         // controller: _controller3,
//                         //initialValue: _initialValue,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                         icon: Icon(Icons.event),
//                         dateHintText: "Today",
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) => setState(() => _valueChanged3 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate3 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
//                       ),
//                     ),
//                     VerticalDivider(
//                       thickness: 2,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.time,
//                         //timePickerEntryModeInput: true,
//                         //controller: _controller4,
//                         initialValue: '',
//                         //_initialValue,
//                         icon: Icon(Icons.access_time),
//                         timeHintText: "Time",
//                         use24HourFormat: false,
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) =>
//                         //     // setState(() => _valueChanged4 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate4 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Column(
//           children: [
//             Container(
//               height: 400,
//               width: 330,
//               child: Column(
//                 children: <Widget>[
//                   Expanded(
//                     child: ListView.separated(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.vertical,
//                         separatorBuilder: (BuildContext context, int index) {
//                           return SizedBox(
//                             height: 10,
//                           );
//                         },
//                         itemCount: 3,
//                         itemBuilder: (BuildContext context, int index) {
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (
//                                       context) => const SearchDriverBike()));
//                             },
//                             child: Container(
//                               width: 350,
//                               height: 220,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       offset: Offset(0.0, 2.0),
//                                       blurRadius: 3.0,
//                                     ),
//                                   ]
//                               ),
//                               child: Column(
//                                 children: <Widget>[
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 30,
//                                         ),
//                                         Image(
//                                             image: NetworkImage(
//                                                 vehicleimg[index])),
//                                         SizedBox(
//                                           width: 90,
//                                         ),
//                                         Text(
//                                           'Rs 150 - Rs 200',
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Text(
//                                           vehiclename[index],
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 14,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                         SizedBox(
//                                           width: 130,
//                                         ),
//                                         Container(
//                                             height: 30,
//                                             width: 70,
//                                             alignment: Alignment.center,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xffffC000),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(20)),
//                                             ),
//                                             child: Text(
//                                               '3 min',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 40,
//                                     width: 250,
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '    Max : 1 Person',
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 20,
//                                     width: 400,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Text(
//                                           'Cc:',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 10,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Container(
//                                           height: 50,
//                                           width: 90,
//                                           child: MenuButton<String>(
//                                             child: normalChildButton,
//                                             items: keys,
//                                             itemBuilder: (String value) =>
//                                                 Container(
//                                                   height: 40,
//                                                   alignment: Alignment
//                                                       .centerLeft,
//                                                   padding: const EdgeInsets
//                                                       .symmetric(vertical: 0.0,
//                                                       horizontal: 16),
//                                                   child: Text(value),
//                                                 ),
//                                             toggledChild: Container(
//                                               child: normalChildButton,
//                                             ),
//                                             // onItemSelected: (String value) {
//                                             //   setState(() {
//                                             //     selectedKey = value;
//                                             //   });
//                                             // },
//                                             onMenuButtonToggle: (
//                                                 bool isToggle) {
//                                               print(isToggle);
//                                             },
//                                           ),
//                                         ),
//                                         SizedBox(width: 30,),
//                                         Container(
//                                             height: 30,
//                                             width: 110,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'Estimated trip time :',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                         Container(
//                                             height: 30,
//                                             width: 40,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               '24 min',
//                                               style: TextStyle(
//                                                   color: Colors.blue,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//       Column(children: <Widget>[
//         Container(
//           width: 350,
//           height: 220,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   offset: Offset(0.0, 1.0),
//                   blurRadius: 6.0,
//                 ),
//               ]),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 30, 5, 20),
//                     child: Image(
//                       image: AssetImage("assets/images/img_12.png"),
//                       height: 120,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // padding: EdgeInsets.fromLTRB(5, 30, 5, 30),
//                         height: 60,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: new InputDecoration(
//                               hintText: "24, Ocean avenue",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 90,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: "01, Sector OH",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               IntrinsicHeight(
//                 child: Row(
//                   children: <Widget>[
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.date,
//                         //dateMask: 'yyyy/MM/dd',
//                         // controller: _controller3,
//                         //initialValue: _initialValue,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                         icon: Icon(Icons.event),
//                         dateHintText: "Today",
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) => setState(() => _valueChanged3 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate3 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
//                       ),
//                     ),
//                     VerticalDivider(
//                       thickness: 2,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.time,
//                         //timePickerEntryModeInput: true,
//                         //controller: _controller4,
//                         initialValue: '',
//                         //_initialValue,
//                         icon: Icon(Icons.access_time),
//                         timeHintText: "Time",
//                         use24HourFormat: false,
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) =>
//                         //     // setState(() => _valueChanged4 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate4 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(
//                         builder: (context) => const SearchDriverBike()));
//               },
//               child: Container(
//                 height: 350,
//                 width: 330,
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                       child: ListView.separated(
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           separatorBuilder: (BuildContext context, int index) {
//                             return SizedBox(
//                               height: 10,
//                             );
//                           },
//                           itemCount: 5,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Container(
//                               width: 350,
//                               height: 220,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       offset: Offset(0.0, 2.0),
//                                       blurRadius: 3.0,
//                                     ),
//                                   ]
//                               ),
//                               child: Column(
//                                 children: <Widget>[
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 30,
//                                         ),
//                                         Image(
//                                             image: NetworkImage(cabimg[index])),
//                                         SizedBox(
//                                           width: 80,
//                                         ),
//                                         Text(
//                                           cabprices[index],
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Text(
//                                           cabname[index],
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 15,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                         SizedBox(
//                                           width: 90,
//                                         ),
//                                         Container(
//                                             height: 30,
//                                             width: 70,
//                                             alignment: Alignment.center,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xffffC000),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(20)),
//                                             ),
//                                             child: Text(
//                                               '3 min',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 40,
//                                     width: 250,
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '    Max : ' + cabcapacity[index] +
//                                           ' Person',
//                                       style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 20,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(width: 80,),
//                                         Container(
//                                             height: 30,
//                                             width: 120,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'Estimated trip time :',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                         Container(
//                                             height: 30,
//                                             width: 40,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               '24 min',
//                                               style: TextStyle(
//                                                   color: Colors.blue,
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ]),
//       Column(children: <Widget>[
//         Container(
//           width: 350,
//           height: 220,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   offset: Offset(0.0, 1.0),
//                   blurRadius: 6.0,
//                 ),
//               ]),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 30, 5, 20),
//                     child: Image(
//                       image: AssetImage("assets/images/img_12.png"),
//                       height: 120,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // padding: EdgeInsets.fromLTRB(5, 30, 5, 30),
//                         height: 60,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: new InputDecoration(
//                               hintText: "24, Ocean avenue",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 90,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: "01, Sector OH",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               IntrinsicHeight(
//                 child: Row(
//                   children: <Widget>[
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.date,
//                         //dateMask: 'yyyy/MM/dd',
//                         // controller: _controller3,
//                         //initialValue: _initialValue,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                         icon: Icon(Icons.event),
//                         dateHintText: "Today",
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) => setState(() => _valueChanged3 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate3 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
//                       ),
//                     ),
//                     VerticalDivider(
//                       thickness: 2,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.time,
//                         //timePickerEntryModeInput: true,
//                         //controller: _controller4,
//                         initialValue: '',
//                         //_initialValue,
//                         icon: Icon(Icons.access_time),
//                         timeHintText: "Time",
//                         use24HourFormat: false,
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) =>
//                         //     // setState(() => _valueChanged4 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate4 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(
//                         builder: (context) => const SearchDriverBike()));
//               },
//               child: Container(
//                 height: 390,
//                 width: 330,
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                       child: ListView.separated(
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           separatorBuilder: (BuildContext context, int index) {
//                             return SizedBox(
//                               height: 10,
//                             );
//                           },
//                           itemCount: 4,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Container(
//                               width: 350,
//                               height: 220,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       offset: Offset(0.0, 2.0),
//                                       blurRadius: 3.0,
//                                     ),
//                                   ]
//                               ),
//                               child: Column(
//                                 children: <Widget>[
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 30,
//                                         ),
//                                         Image(
//                                             image: NetworkImage(
//                                                 'https://firebasestorage.googleapis.com/v0/b/speedo-ef73e.appspot.com/o/img_21.png?alt=media&token=73997ea2-97db-4d5e-8bc9-bba4e7e974d9')),
//                                         SizedBox(
//                                           width: 80,
//                                         ),
//                                         Text(
//                                           autoprices[index],
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Text(
//                                           autoname[index],
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 15,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                         SizedBox(
//                                           width: 100,
//                                         ),
//                                         Container(
//                                             height: 30,
//                                             width: 70,
//                                             alignment: Alignment.center,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xffffC000),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(20)),
//                                             ),
//                                             child: Text(
//                                               '3 min',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 40,
//                                     width: 250,
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '    Max : 3 Person',
//                                       style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 20,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(width: 80,),
//                                         Container(
//                                             height: 30,
//                                             width: 120,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'Estimated trip time :',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                         Container(
//                                             height: 30,
//                                             width: 40,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               '24 min',
//                                               style: TextStyle(
//                                                   color: Colors.blue,
//                                                   fontSize: 13,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ]),
//       Column(children: <Widget>[
//         Container(
//           width: 350,
//           height: 270,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   offset: Offset(0.0, 1.0),
//                   blurRadius: 6.0,
//                 ),
//               ]),
//           child: Column(
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(10, 30, 5, 20),
//                     child: Image(
//                       image: AssetImage("assets/images/img_12.png"),
//                       height: 120,
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // padding: EdgeInsets.fromLTRB(5, 30, 5, 30),
//                         height: 60,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: new InputDecoration(
//                               hintText: "24, Ocean avenue",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 90,
//                         width: 280,
//                         child: FlatButton(
//                           onPressed: () {},
//                           child: TextField(
//                             decoration: InputDecoration(
//                               hintText: "I'm going to",
//                               // focusedBorder: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               IntrinsicHeight(
//                 child: Row(
//                   children: <Widget>[
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.date,
//                         //dateMask: 'yyyy/MM/dd',
//                         // controller: _controller3,
//                         //initialValue: _initialValue,
//                         firstDate: DateTime(2000),
//                         lastDate: DateTime(2100),
//                         icon: Icon(Icons.event),
//                         dateHintText: "Today",
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) => setState(() => _valueChanged3 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate3 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved3 = val ?? ''),
//                       ),
//                     ),
//                     VerticalDivider(
//                       thickness: 2,
//                     ),
//                     Container(
//                       height: 30,
//                       width: 150,
//                       child: DateTimePicker(
//                         type: DateTimePickerType.time,
//                         //timePickerEntryModeInput: true,
//                         //controller: _controller4,
//                         initialValue: '',
//                         //_initialValue,
//                         icon: Icon(Icons.access_time),
//                         timeHintText: "Time",
//                         use24HourFormat: false,
//                         // locale: Locale('pt', 'BR'),
//                         // onChanged: (val) =>
//                         //     // setState(() => _valueChanged4 = val),
//                         // validator: (val) {
//                         //   setState(() => _valueToValidate4 = val ?? '');
//                         //   return null;
//                         // },
//                         // onSaved: (val) => setState(() => _valueSaved4 = val ?? ''),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Container(
//               //   width: 200,
//               //   height: 50,
//               //   child: Row(
//               //     children: <Widget>[
//               //       Image(image: AssetImage('assets/images/img_15.png')),
//               //       TextField(
//               //         style: TextStyle(color: Colors.black),
//               //         decoration: new InputDecoration(
//               //           hintText: "Enter parcel weight ( Max Weight 20kg )",
//               //           // focusedBorder: InputBorder.none,
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(
//                         builder: (context) => const SearchDriverBike()));
//               },
//               child: Container(
//                 height: 370,
//                 width: 330,
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                       child: ListView.separated(
//                           shrinkWrap: true,
//                           scrollDirection: Axis.vertical,
//                           separatorBuilder: (BuildContext context, int index) {
//                             return SizedBox(
//                               height: 10,
//                             );
//                           },
//                           itemCount: 3,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Container(
//                               width: 350,
//                               height: 220,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius:
//                                   BorderRadius.all(Radius.circular(20)),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.grey,
//                                       offset: Offset(0.0, 2.0),
//                                       blurRadius: 3.0,
//                                     ),
//                                   ]
//                               ),
//                               child: Column(
//                                 children: <Widget>[
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 30,
//                                         ),
//                                         Image(
//                                             image: NetworkImage(
//                                                 vehicleimg[index])),
//                                         SizedBox(
//                                           width: 90,
//                                         ),
//                                         Text(
//                                           'Rs 150 - Rs 200',
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 50,
//                                     width: 300,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Text(
//                                           vehiclename[index],
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 14,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                         SizedBox(
//                                           width: 130,
//                                         ),
//                                         Container(
//                                             height: 30,
//                                             width: 70,
//                                             alignment: Alignment.center,
//                                             decoration: BoxDecoration(
//                                               color: Color(0xffffC000),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(20)),
//                                             ),
//                                             child: Text(
//                                               '3 min',
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w600),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 40,
//                                     width: 250,
//                                     alignment: Alignment.center,
//                                     child: Text(
//                                       '    Max : 1 Person',
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w400),
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 20,
//                                     width: 400,
//                                     child: Row(
//                                       children: <Widget>[
//                                         SizedBox(
//                                           width: 20,
//                                         ),
//                                         Text(
//                                           'Cc:',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: 10,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Container(
//                                           height: 50,
//                                           width: 90,
//                                           child: MenuButton<String>(
//                                             child: normalChildButton,
//                                             items: keys,
//                                             itemBuilder: (String value) =>
//                                                 Container(
//                                                   height: 40,
//                                                   alignment: Alignment
//                                                       .centerLeft,
//                                                   padding: const EdgeInsets
//                                                       .symmetric(vertical: 0.0,
//                                                       horizontal: 16),
//                                                   child: Text(value),
//                                                 ),
//                                             toggledChild: Container(
//                                               child: normalChildButton,
//                                             ),
//                                             // onItemSelected: (String value) {
//                                             //   setState(() {
//                                             //     selectedKey = value;
//                                             //   });
//                                             // },
//                                             onMenuButtonToggle: (
//                                                 bool isToggle) {
//                                               print(isToggle);
//                                             },
//                                           ),
//                                         ),
//                                         SizedBox(width: 30,),
//                                         Container(
//                                             height: 30,
//                                             width: 110,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               'Estimated trip time :',
//                                               style: TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                         Container(
//                                             height: 30,
//                                             width: 40,
//                                             alignment: Alignment.center,
//                                             child: Text(
//                                               '24 min',
//                                               style: TextStyle(
//                                                   color: Colors.blue,
//                                                   fontSize: 12,
//                                                   fontWeight: FontWeight.w400),
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ]),
//     ];
//     return (navi[sta]);
//   }
// }
//
//
//
//
