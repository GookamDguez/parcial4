// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _initialCameraPosition =
      const CameraPosition(target: LatLng(13.831604, -89.368194), zoom: 10.5);

  final preset = [
    {
      "id": "lourdes",
      "lat": 13.723635,
      "lng": -89.368194,
      "titulo": "Lourdes Centro",
      "desc": "2º calle oriente y 4º av. Norte"
    },
    {
      "id": "ciudad_merliot",
      "lat": 13.678180,
      "lng": -89.264736,
      "titulo": "Ciudad Merliot",
      "desc": "calle chiltiupan #38"
    },
    {
      "id": "santa_tecla",
      "lat": 13.716382,
      "lng": -89.139535,
      "titulo": "Santa Tecla Centro",
      "desc": "8 avenida sur #2-5"
    },
    {
      "id": "san_vicente",
      "lat": 13.642459,
      "lng": -88.785963,
      "titulo": "San Vicente Centro",
      "desc": "Ave Crescencio Miranda"
    }
  ];

  String _selectedOffice = '';

  Iterable<Marker> _buildMarkers() {
    return preset.map((office) {
      return Marker(
          markerId: MarkerId(office['id'].toString()),
          position: LatLng(double.parse(office['lat'].toString()),
              double.parse(office['lng'].toString())),
          infoWindow: InfoWindow(
            title: office['titulo'].toString(),
            snippet: office['desc'].toString(),
          ),
          icon: office['id'] == _selectedOffice
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)
              : BitmapDescriptor.defaultMarker,
          consumeTapEvents: false,
          onTap: () {
            setState(() {
              _selectedOffice = office['id'].toString();
            });
          });
    });
  }
//hambre sueño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encomiendas SV"),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _buildMarkers().toSet(),
        //mapType: MapType.hybrid,
      ),
    );
  }
}
