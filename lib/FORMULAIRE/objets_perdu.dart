import 'package:smart_parking/FORMULAIRE/pop_up.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'BRAVO.dart';

class forom3 extends StatefulWidget {


  @override
  _objetperdu createState() =>_objetperdu();
}

class _objetperdu extends State<forom3> {
  String uploadedFileUrl =
      ' https://images.app.goo.gl/Go3HBa3KSeSjKh9C9';


  TextEditingController textController1;
  TextEditingController numtelController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String _selectedLocation;
  TextEditingController dateinput1= TextEditingController();

  @override
  void initState() {
    super.initState();
    dateinput1.text = "";
    numtelController = TextEditingController();
    textController1 = TextEditingController();

  }
  List<String> _locations = ['parking a ', 'parking b '];
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitCubeGrid(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final createUserUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
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
              'objet perdu',
              style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).tertiaryColor,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 11),
                        child: TextFormField(
                          controller: textController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'image',
                            labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'insérer une image...',
                            hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF4F4F4),
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                            prefixIcon: Icon(
                              Icons.picture_as_pdf,
                              color: Color(0xFF6C63FF),
                              size: 26,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF4E434E),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 11),
                    child:
                          FFButtonWidget(

                            onPressed: () async {
                              final selectedMedia = await selectMedia(
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                final downloadUrls = (await Future.wait(
                                    selectedMedia.map((m) async =>
                                    await uploadData(
                                        m.storagePath, m.bytes))))
                                    .where((u) => u != null)
                                    .toList();
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                if (downloadUrls != null &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() =>
                                  uploadedFileUrl = downloadUrls.first);
                                  showUploadMessage(
                                    context,
                                    'Success!',
                                  );
                                } else {
                                  showUploadMessage(
                                    context,
                                    'Failed to upload media',
                                  );
                                  return;
                                }
                              }
                            },
                            text: 'Modifier la photo',
                            options: FFButtonOptions(
                              width: 150,
                              height: 40,
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryColor,
                                fontSize: 14,
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 11),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'commentaire',
                      labelStyle:
                      FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintText: 'exprimez-vous...',
                      hintStyle:
                      FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF4F4F4),
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      prefixIcon: Icon(
                        Icons.menu_book,
                        color: Color(0xFF6C63FF),
                        size: 26,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF4E434E),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),



          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 11),
            child:
                DropdownButtonFormField( hint: Text('selectionner le parking '),

                  value: _selectedLocation,

                  decoration: InputDecoration(
                    labelText: ' parking ',
                    labelStyle:
                    FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: 'selectionnez parking ...',
                    hintStyle:
                    FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF4F4F4),
                    contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                    prefixIcon: Icon(
                      Icons.local_library_outlined,
                      color: Color(0xFF6C63FF),
                      size: 26,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF4E434E),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  // Not necessary for Option 1

                  onChanged: (newValue) { setState(() { _selectedLocation = newValue; }); },
                  items: _locations.map((location) { return DropdownMenuItem( child: new Text(location),
                    value: location, ); }).toList(), ),
          ),


          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 11),
            child:
                TextField(
                  controller: dateinput1, //editing controller of this TextField
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'date de la perte ',
                    labelStyle:
                    FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    hintText: 'date ...',
                    hintStyle:
                    FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF95A1AC),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFDBE2E7),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF4F4F4),
                    contentPadding:
                    EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Color(0xFF6C63FF),
                      size: 26,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF4E434E),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  readOnly: true,  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                    );

                    if(pickedDate != null ){
                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput1.text = formattedDate; //set output date to TextField value.
                      });
                    }else{
                      print("Date is not selected");
                    }
                  },
                ),),

          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 11),
            child:
                TextFormField(
                    controller: numtelController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'numéro de téléphone',
                      labelStyle:
                      FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      hintStyle:
                      FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Lexend Deca',
                        color: Color(0xFF95A1AC),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFDBE2E7),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      prefixIcon: Icon(
                        Icons.call,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        size: 26,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF14181B),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    keyboardType: TextInputType.number,
                  ),
          ),

                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Map<String,dynamic>data={"commentaire ": textController1.text,"parking ": _selectedLocation,"date de perte": dateinput1.text,"numéro de tel ": numtelController.text
                        };
                        FirebaseFirestore.instance.collection("declaration_objet_perdu").add(data);
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.

                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExistsPage(),
                          ),
                        );
                      },
                      text: 'publier ',
                      options: FFButtonOptions(
                        width: 160,
                        height: 45,
                        color: Color(0xFF6C63FF),
                        textStyle:
                        FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
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
              ],
            ),
          ), //body
        );
      },
    );
  }
}
