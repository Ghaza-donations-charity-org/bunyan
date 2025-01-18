import 'package:flutter/material.dart';

class DropOffLocations extends StatefulWidget {
  const DropOffLocations({super.key});

  @override
  State<DropOffLocations> createState() => _DropOffLocationsState();
}

class _DropOffLocationsState extends State<DropOffLocations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drop Off Locations"),
      ),
      body: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
        const Text("Here are our current drop off locations:"),
        const SizedBox(height: 50),

        ...dropOffLocations.map((location) => Padding(padding: const EdgeInsets.all(8.0), child: Text(location))),


      ])),
    );
  }

  List<String> dropOffLocations = [
    "5 As Sarayat st. Cairo, Egypt",
    "10 El Sheikh Zayed st. Cairo, Egypt",
    "15 El Haram st. Cairo, Egypt",
    "20 El Maadi st. Cairo, Egypt",
    "25 El Nasr City st. Cairo, Egypt",
    "30 El Nozha st. Cairo, Egypt",
    "35 El Zaytouna st. Cairo, Egypt",
    "40 El Zaytouna st. Cairo, Egypt",
    "45 El Zaytouna st. Cairo, Egypt",
  ];
}
