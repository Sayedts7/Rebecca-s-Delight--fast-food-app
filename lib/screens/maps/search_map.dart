import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rebeca_delight/constants/contstants.dart';
import 'package:rebeca_delight/screens/maps/location.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;


class SearchMap extends StatefulWidget {

   SearchMap({Key? key}) : super(key: key);

  @override
  State<SearchMap> createState() => _SearchMapState();
}

class _SearchMapState extends State<SearchMap> {

  Future<Position> getUsercurrentlocation() async{
    await Geolocator.requestPermission().then((value) {

    }).onError((error, stackTrace) {
      print('error');
    });
    return await Geolocator.getCurrentPosition();
  }
var stlang;
var stlat;

final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _textcontroller = TextEditingController();
  var uuid = Uuid();
  String _sessiontoken = '123345';
  List<dynamic> _placeslist = [];

  void onChange(){
    if(_sessiontoken == null){
      setState(() {
        _sessiontoken == uuid.v4();
      });
    }
    getSuggestion(_textcontroller.text);
  }
  void getSuggestion(String input) async{
    String _kplaces_Api_key = 'AIzaSyCUO40W_nDrilaL-2ny5RcWYpzHdlNil-M';
    String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$_kplaces_Api_key&sessiontoken=$_sessiontoken';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();

    if (response.statusCode ==200){
      setState(() {
        _placeslist = jsonDecode(response.body.toString()) ['predictions'];
      });

    }else{
      throw Exception('Error');
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textcontroller.addListener(() {
      onChange();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text(name),
           Padding(
             padding: const EdgeInsets.only(top: 15.0,left: 15,bottom: 15, right: 15),
             child: Row(
               children: [
                 Container(
                   width: 250,
                   child: TextFormField(
                     style: TextStyle(color: Colors.black, fontFamily: 'Roboto',fontSize: 20),
                     controller: _textcontroller,
                     decoration: InputDecoration(
                         filled: true,
                         fillColor: Colors.white,
                         hintText: 'Enter location',
                         hintStyle: TextStyle(color: Colors.black),

                         enabledBorder: OutlineInputBorder(

                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(width: 2),
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(width: 2))),
                   ),
                 ),
                 GestureDetector(
                   onTap: ()async{
                     List<Location> locations = await locationFromAddress(_textcontroller.text);
                     print('tab');
                     print(stlat);
                     print(stlang);
                     // print(name);
                     // GoogleMapController controller = await _controller.future;
                     // controller.animateCamera(CameraUpdate.newCameraPosition(
                     //     CameraPosition(target: LatLng(stlat, stlang), zoom: 14)));
                     setState(() {
                       stlat = locations.last.latitude;
                       stlang = locations.last.longitude;

                     });
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>location(lang: stlang, lat: stlang)));
                   },
                   child: Container(
                     height: 60,
                     width: 80,
                     decoration: BoxDecoration(
                       gradient: LinearGradient(colors: [appColor1,appColor2]),
                       borderRadius: BorderRadius.circular(10)
                     ),
                     child: Center(child: Text('Search',style: txtstyll,),),
                   ),
                 ),
               ],
             ),
           ),
            Expanded(
              child: ListView.builder(
                  itemCount: _placeslist.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      onTap: ()async{
                        List<Location> locations = await locationFromAddress( _placeslist[index]['description']);
                        print('tab');
                        print(stlat);
                        print(stlang);
                       
                        setState(() {
                          stlat = locations.last.latitude;
                          stlang = locations.last.longitude;

                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> location(lat: stlat,lang: stlang,)));
                      },
                      title: Container(color:Colors.black,
                          height: 50,
                          child: Center(child: Text(_placeslist[index]['description']))),

                    );
                  }),
            ),
            Align(alignment: Alignment.bottomRight,

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 50,
                    width: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     gradient: LinearGradient(colors: [appColor1,appColor2])
                   ),
                    child: IconButton(onPressed: ()async{
                      getUsercurrentlocation().then((value) async{
                       var latt = value.latitude;
                       var langg = value.longitude;
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> location(lat: latt, lang: langg)));
                      });


                    },

                        icon:const Icon( Icons.location_searching_sharp)),),
                ))
          ],
        ),
      ),
    );
  }
}










