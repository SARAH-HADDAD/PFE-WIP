import '../backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';

class P extends StatefulWidget {
  const P({Key key}) : super(key: key);
  @override
  _PState createState() => _PState();
}

class _PState extends State<P> {
  //The code below is the leading powerhouse — It performs the read function from our Cloud Firestore.

  //It gets an instance of our parkings collection and stores it in our Stream<QuerySnapshot> variable.

  final Stream<QuerySnapshot> _parkingsStream = FirebaseFirestore.instance
      .collection('parking')
      .where('d', isLessThan: 1000)
      .orderBy('d', descending: true)
      .snapshots();

/* The code below is a Flutter widget — this creates a stream

 which updates the widget state whenever
 there is a change to the data snapshot on the database. It displays a list of all the parkings */

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
      body: StreamBuilder<QuerySnapshot>(
        stream: _parkingsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> parking =
                  document.data() as Map<String, dynamic>;
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: (parking['type'].compareTo('P') == 0 &&
                          parking['nbPlaceDispo'] > 0)
                      ? Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 30),
                                child: Text(
                                  parking['nom'],
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 18),
                                child: Text(
                                  parking['adresse'],
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .gray600,
                                      ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 18),
                                    child: Text(
                                      'Places disponibles : ${parking['nbPlaceDispo'].toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .black600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 18),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.credit_card_rounded,
                                            color: Colors.pink,
                                            size: 24.0,
                                            semanticLabel:
                                                'Text to announce in accessibility modes',
                                          ),
                                          Text(
                                            '${parking['prix'].toString()}DA/heure',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .black600,
                                                ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 18),
                                child: Row(
                                  children: <Widget>[
                                    RatingBarIndicator(
                                      rating: (parking["rating"]).toDouble(),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: 23.0,
                                      direction: Axis.horizontal,
                                    ),
                                    Text(
                                      " (${parking["user_ratings_total"].toString()})                                                              ",
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 0, top: 18),
                                child: Center(
                                  child: FFButtonWidget(
                                    onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePageWidget()),
                                    ),
                                    text: 'Réserver',
                                    options: FFButtonOptions(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 45,
                                      color: Color(0xFF6C63FF),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 2,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: 30,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        )
                      : null);
            }).toList(),
          );
        },
      ),
    );
  }
}
////