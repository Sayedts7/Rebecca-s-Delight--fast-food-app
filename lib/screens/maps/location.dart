import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../constants/contstants.dart';
import 'package:http/http.dart' as hhtp;

class location extends StatefulWidget {
   double lat;
   double lang;

   location({
     required this.lat,
     required this.lang,
   });

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {

  final Completer<GoogleMapController> _controller = Completer();
  Uint8List? markerImage;
  List<String> images = [
    'images/logo.png', 'images/logo.png',  'images/logo.png',
  ];

  final List<Marker> _marker = [];
  final List<LatLng> _list =  [
     LatLng(34.1986, 72.0404),

    LatLng(33.9739966, 71.4427992),
    LatLng(33.9985625, 71.4646875),

    ];


  Future<Uint8List> getBytesfromassets(String path, int width) async{
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: width);
    ui.FrameInfo fi =await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))! .buffer.asUint8List();
  }

  loadimage()async{
    for(int i = 0; i < images.length; i++){
      final Uint8List markerIcon = await getBytesfromassets(images[i], 200);
_marker.add(
  Marker(
    markerId: MarkerId(i.toString()),

    icon: BitmapDescriptor.fromBytes(markerIcon),

    position: _list[i],
    infoWindow: InfoWindow(title: 'My Home')),

);
setState(() {

});
    }
  }
   // TextEditingController _textcontroller = TextEditingController();
    var stlat;
  var stlang;
  Future<Position> getUsercurrentlocation() async{
    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace) {
      print('error');
    });
    return await Geolocator.getCurrentPosition();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadimage();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [

              GoogleMap(trafficEnabled: true,
                initialCameraPosition:

              CameraPosition(target: (LatLng(widget.lat, widget.lang)), zoom: 14),
                markers: Set<Marker>.of(_marker),
                myLocationEnabled: true,
                mapType: MapType.terrain,

                mapToolbarEnabled: true,
                compassEnabled: true,
                  onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
                  },
              ),



              // Positioned(
              //   right: 10,
              //   top: 360,
              //   child: GestureDetector(
              //     onTap: () async {
              //
              //     },
              //     child: Container(
              //       height: 55,
              //       width: 80,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           gradient:
              //               LinearGradient(colors: [appColor1, appColor2])),
              //       child: Center(
              //           child: Text(
              //         'Search',
              //         style: txtstyll,
              //       )),
              //     ),
              //   ),
              // ),







              // Container(
              //   height: 55,
              //   width: 80,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: Colors.pink,),
              //   child: Center(
              //       child: Text(
              //         stlat,
              //         style: txtstyll,
              //       )),
              // ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //     child: Icon(Icons.location_on),
        //     onPressed: () async {
        //
        //       getUsercurrentlocation().then((value) async{
        //         GoogleMapController controller =await _controller.future;
        //         controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        //             target: LatLng(value.latitude, value.longitude),zoom: 20)));
        //         setState((
        //
        //             ) {
        //
        //         });
        //       });
        //
        //
        //     })
         );
  }
}
