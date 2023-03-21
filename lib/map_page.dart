import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final List<Polygon> listOfPoly = [];
  final List<LatLng> listOfLatLng = [];
  final List<Marker> listOfMarkers = [];
  bool isReadyToDraw = false;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-25.3003980168176, -54.1147789386197),
    zoom: 16,
  );

  @override
  void didUpdateWidget(covariant MapPage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  _setPoly() {
    listOfPoly.add(
      Polygon(
        polygonId: const PolygonId('polygonIdVal'),
        points: listOfLatLng,
        strokeWidth: 5,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15),
      ),
    );
    _setMarkers();
    setState(() {});
  }

  _setMarkers() {
    listOfMarkers.clear();
    for (int i = 0; i < listOfLatLng.length; i++) {
      listOfMarkers.add(
        Marker(
          markerId: MarkerId('marker_$i'),
          position: listOfLatLng[i],
          draggable: true,
          onDragEnd: (LatLng position) {
            setState(() {
              listOfLatLng[i] = position;
              _setPoly();
            });
          },
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
      ),
      body: SafeArea(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          markers: listOfMarkers.toSet(),
          polygons: listOfPoly.toSet(),
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          onTap: (LatLng latLng) {
            if (!isReadyToDraw) return;

            listOfLatLng.add(latLng);
            _setPoly();
            _setMarkers();
          },
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        children: [
          FloatingActionButton.small(
            child: const Icon(Icons.edit),
            onPressed: () {
              isReadyToDraw = true;
            },
          ),
          FloatingActionButton.small(
            child: const Icon(Icons.undo),
            onPressed: () {
              if (listOfLatLng.isEmpty) return;

              listOfLatLng.removeLast();
              listOfPoly.removeLast();
              _setPoly();
              _setMarkers();
              setState(() {});
            },
          ),
          FloatingActionButton.small(
            child: const Icon(Icons.save),
            onPressed: () {
              // TODO: Quando clicar em salvar, fazer a conexão com BD e enviar os dados
            },
          ),
        ],
      ),
    );
  }
}
