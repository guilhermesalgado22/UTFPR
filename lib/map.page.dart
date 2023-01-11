import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//class HomeController extends ChangeNotifier{
//final Map <PolylineId, Polyline> _polylines ={};
//final Map<PolygonId, Polygon> _polygons ={}

//Set<Polyline> get polylines => _polylines.values.toSet();
//Set<Polygon> get polygons => _polygons.values.toSet();

//String _polylineId ='0';

//}

//}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-25.300823575989064, -54.11498595134365),
    zoom: 16,
  );

  //Set<Polygon> _polygon = HashSet<Polygon>();

  //late String _polylineId;
  //late String _polygonId;

  //void newPolyline(){
  //_polylineId = DateTime.now().millisecondsSinceEpoch.toString();

  //}
  //void newPolygon(){
  //_polylineId = DateTime.now().millisecondsSinceEpoch.toString();
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Google Maps")),
        body: Container(
            child: SafeArea(
                child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete((controller));
                    }))),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ));
  }
/*
Future<void> _drawpolygon() async {
  void onTap(LatLng position) async {

  // ignore: non_constant_identifier_names
  final PolygonId = PolygonId(_polygonId);
  late Polygon polygon;
  if  (_polygons.containskey(polygonId)){
    final tmp = _polygons[polygonId]!;
    polygon = tmp.copywith(
      pointsParam: [...tmp.points, position],
    );

  }else{
    final color =Colors.primaries[_polygons.length];
    polygon = Polygon(
      polygonId: polygonId,
      points: [position],
      strokeWidth: 4,
      strokeColor: color,
      fillColor: color.withOpacity(0,4),
    );
  }
}
}*/
}
