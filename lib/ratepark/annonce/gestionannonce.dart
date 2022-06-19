import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_parking/component/sideMenu.dart';
import 'package:smart_parking/config/size_config.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_theme.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_widgets.dart';
import 'package:smart_parking/style/style.dart';

class Gestionannonce extends StatefulWidget {

  const Gestionannonce({Key key}) : super(key: key);


  @override
  State<Gestionannonce> createState() => _Gestionannoncetate();
}

class _Gestionannoncetate extends State<Gestionannonce> {
  String _selectedLocation;
  TextEditingController dateinput1= TextEditingController();
  List<String> _locations = ['parking a ', 'parking b '];
  @override
  void initState() {
    super.initState();
  }
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final user=FirebaseAuth.instance.currentUser;

  // text fields' controllers
  TextEditingController textController1;
  TextEditingController numtelController;

  final CollectionReference _declaration_objet_perdu =
  FirebaseFirestore.instance.collection('declaration_objet_perdu');
  void dispose(){
    textController1.dispose();
    numtelController.dispose();
    _selectedLocation;
    dateinput1.dispose();
    super.dispose();
  }
  Future<void> _create([DocumentSnapshot _declaration_objet_perdu]) async {

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.only(left: 15.0, top: 0.0,bottom: 0),
                      prefixIcon: Icon(Icons.search, size: 20,color: Colors.grey,),
                      hintText:"chercher objet",hintStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 14.0,fontFamily: 'poppins-regular'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      )
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
          Padding(
          padding: EdgeInsetsDirectional.fromSTEB(25, 10, 25, 11),
               child: Center(
          child:FFButtonWidget(
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

          Map<String,dynamic>data={"commentaire ": textController1.text,"parking ": _selectedLocation,"date de perte": dateinput1.text,"numéro de tel ": numtelController.text
          };
          FirebaseFirestore.instance.collection("declaration_objet_perdu").add(data);

                      Navigator.of(context).pop();
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

          ),),

              ],
            ),
          );

        });
  }
  Future<void> _update([DocumentSnapshot documentSnapshot]) async {
    if (documentSnapshot != null) {

    textController1.text = documentSnapshot['commentaire'];
    numtelController.text=documentSnapshot['numéro tel'];
    _selectedLocation=documentSnapshot['parking'];
    dateinput1.text=documentSnapshot['date de perte'];

    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          firstDate: DateTime.now() ,
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
                ElevatedButton(

                  child: const Text( 'Update'),
              /*    onPressed: () async {

                  //  if (textController1.text.trim() != null
                   //     &&_selectedLocation.trim() != null
                   //     && dateinput1.text.trim() != null
                      //  && numtelController.text.trim() != null

                //    ) {
                //      await FirebaseFirestore.instance.collection('parking').add({
                //        "commentaire ": textController1.text.trim(),
                //        "parking ": _selectedLocation.trim(),
                  //      "date de perte": dateinput1.text.trim(),

                       "numéro de tel ": numtelController.text.trim(),
//
                      });

                      Navigator.of(context).pop();
                    }
                  },
*/

                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await _declaration_objet_perdu.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        key: _drawerKey,
        drawer: SizedBox(width: 100, child: SideMenu()),
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
        body:SafeArea(
          child:
          Expanded(
            flex: 10,
            child: Center(
              child: StreamBuilder(
                stream: _declaration_objet_perdu.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                        streamSnapshot.data.docs[index];
                        return Row(

                          children: [

                            SizedBox(width: 450,),
                            Center(
                              child: Card(

                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),),
                                margin: const EdgeInsets.all(10),
                                child: Container(
                                  width: 600,
                                  height:250,
                                  child:


                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                                                   padding: const EdgeInsets.only(left: 20, top: 30),
                                        child: PrimaryText(
                                            text :documentSnapshot['commentaire'],
                                            size: 20,
                                            fontWeight: FontWeight.w800
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(left: 20, top: 18),
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
                                                documentSnapshot['date de perte '],
                                              ),
                                            ],
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20, top: 18),
                                        child: Text(
                                          documentSnapshot['numéro tel'],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20, top: 18),
                                            child: Text(
                        documentSnapshot['parking'],
                                            ),
                                          ),

                                        ],
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(width: 50,),
                                          IconButton(
                                              icon: const Icon(Icons.edit),

                                              onPressed: () =>
                                                  _update(documentSnapshot)),
                                          IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () =>
                                                  _delete(documentSnapshot.id)),
                                          SizedBox(width: 50,),
                                        ],
                                      )
                                    ],
                                  ),




                                  /*IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () =>
                                                  _update(documentSnapshot)),
                                          IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () =>
                                                  _delete(documentSnapshot.id)),*/
                                ),



                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ),
// Add new product
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add
          ),
          backgroundColor: Colors.deepPurpleAccent,

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );

  }
}

