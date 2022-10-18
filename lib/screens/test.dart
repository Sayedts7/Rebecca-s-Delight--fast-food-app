// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_geocoder/geocoder.dart';
//
// import 'package:rebeca_delight/screens/location.dart';
//
// class test extends StatefulWidget {
//   const test({Key? key}) : super(key: key);
//
//   @override
//   State<test> createState() => _testState();
// }
//
// class _testState extends State<test> {
//   String stAddress = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//                 width:200,
//                 height: 200,
//                 color: Colors.pink,
//                 child: Text(stAddress)),
//              GestureDetector(
//                 onTap: () async {
//
//                  final coordinates = new Coordinates(34.239677, 71.957515);
//                   var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//                  var first = address.first;
//                  print(first.featureName.toString()+' '+first.adminArea.toString());
//                  setState(() {
//                    stAddress = first.featureName.toString()+' '+first.locality.toString();
//                  });
//                  },
//                 child: Container(
//                     width: 200,
//                     height: 50,
//                     color: Colors.blue,
//                     child: Center(child: Text('COnvert'))))
//
//
//           ],
//         )
//
//     );
//   }
// }
