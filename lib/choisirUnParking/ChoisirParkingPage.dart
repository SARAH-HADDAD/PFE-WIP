import '../backend/backend.dart';
import 'package:flutter/material.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ChoisirUnParking.dart';

class ChoisirParkingPage extends StatefulWidget {
  const ChoisirParkingPage({Key key}) : super(key: key);
  @override
  _ChoisirParkingPageState createState() => _ChoisirParkingPageState();
}

class _ChoisirParkingPageState extends State<ChoisirParkingPage> {
  //To perform a write operation, we will first create a collection instance and a variable to hold our parking text input
  // CollectionReference parkings =
  //     FirebaseFirestore.instance.collection('parkings');
  // int distance = 0;
  //   final Stream<QuerySnapshot> _parkingsStream = FirebaseFirestore.instance
  //     .collection('parking')
  //     .orderBy("rating", descending: true)
  //     .snapshots();
  List<String> docIDs = [];
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('parking').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF1C0527),
            size: 24,
          ),
        ),
        title: Text(
          'Choisir un parking',
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).customColor1,
      body: ParkingsInformation(),
    );
  }
}
//ChoisirParkingPage()
//ChoisirParkingPage