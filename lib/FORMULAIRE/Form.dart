import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:smart_parking/FORMULAIRE/firebas.service.dart';
import 'package:smart_parking/FORMULAIRE/pop_up.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'BRAVO.dart';





class form extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<form> {
  List<String> _type = ['dispute', 'vole','accident ','état du parking','agents ','others....']; // Option 2 String _selectedLocation;
  TextEditingController sampledata1=new TextEditingController();
  TextEditingController sampledata2=new TextEditingController();
  TextEditingController sampledata3=new TextEditingController();
  TextEditingController sampledata4=new TextEditingController();
  TextEditingController sampledata5=new TextEditingController();
  TextEditingController sampledata6=new TextEditingController();
  TextEditingController sampledata7=new TextEditingController();
  TextEditingController sampledata8=new TextEditingController();
  TextEditingController textController1=new TextEditingController();
  String uploadedFileUrl = '';

String id ='';



  String _selectedLocation;
  TextEditingController dateinput2 = TextEditingController();
  TextEditingController dateinput1= TextEditingController();
  String dropdownValue = 'One';

  final _formKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final form_Key = GlobalKey<FormState>();



  final bool allowDecimal = false;
  //key for form
  String username = '';
  String email = '';
  String password = '';

// the current step
  int _currentStep = 0;
// Determines whether the stepper's orientation is vertical or horizontal
  // This variable can be changed by using the switch below
  bool _isVerticalStepper = true;

  // This function will be triggered when a step is tapped
  _stepTapped(int step) {
    setState(() => _currentStep = step);
  }

  // This function will be called when the continue button is tapped
  _stepContinue() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  // This function will be called when the cancel button is tapped
  _stepCancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  List<String> _locations = ['parking a '];

  @override


  void initState() {
    dateinput1.text = "";
    dateinput2.text= ""; //set the initial value of text field
    super.initState();
  }
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
            'réclamation à propos du parking   ',
            style: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.of(context).tertiaryColor,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        key: _scaffoldKey,
        body: Column(
            children: [



              const Divider(
                thickness: 2,
                height: 30,
              ),

              Expanded(

    child: Theme(
    data: ThemeData(
    canvasColor:Colors.white,
    colorScheme: Theme.of(context).colorScheme.copyWith(
    primary: Color(0xFF6C63FF),
    ),
    ),
                // the Stepper widget
                child: Stepper(

                  type: _isVerticalStepper
                      ? StepperType.vertical
                      : StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => _stepTapped(step),
                  onStepContinue: _stepContinue,
                  onStepCancel: _stepCancel,
                  steps: [

                    Step(

                      title: Text("Task-1"),
                      content:Container(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Form(
                          key: _formKey, //key for form
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height:height*0.04),
                                Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(color: Colors.transparent),
                                        height: 25.0,
                                        width: 25.0,
                                        child: Center(
                                          child: Text(
                                            ' \'ps:  remplissez les information\n  plus-tot possible . ',
                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                              fontFamily: 'Lexend Deca',
                                              color: FlutterFlowTheme.of(context).grayLight,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),




                                TextFormField(
                                  controller: textController1,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'décrivez ce qui c \'est passé' ,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'ce champ est obligatoire';
                                    }
                                    return null;
                                  },

                                ),


                                SizedBox(height:height*0.04),

                          TextField(
                            controller: dateinput1, //editing controller of this TextField
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'date  ',
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
                          ),


                                SizedBox(height:height*0.04),


                                  DropdownButtonFormField( hint: Text('quel parking '),

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
                                      hintText: 'quel parking ...',
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
                                        Icons.local_parking,
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



                                // height: 50,





                              ]

                          ),
                        ),





                      ),

                      state: _currentStep<= 0 ? StepState.editing : StepState.complete,
                      isActive: _currentStep >= 0,

                      subtitle: Text("Compled"),
                    ),
                    Step(
                      title: Text("Task-2"),

                      content:
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          key: formKey, //key for form
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                  child:Center(child: Text(
                                    ' parlons de l\'incident . ',
                                      style: FlutterFlowTheme.of(context).subtitle2.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context).tertiaryColor,
                                      ),),
                                  ),
                                ),
                                SizedBox(height:height*0.04),
                                  DropdownButtonFormField( hint: Text('séléctionner le type  '),

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
                                      hintText: 'le probléme ...',
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
                                      EdgeInsetsDirectional.fromSTEB(10, 20, 0, 20),
                                      prefixIcon: Icon(
                                        Icons.check_outlined,
                                        color: Color(0xFF6C63FF),
                                        size: 20,
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
                                    items: _type.map((location) { return DropdownMenuItem( child: new Text(location),
                                      value: location, ); }).toList(), ),



                              ]
                          ),
                        ),
                      ),
                      state:
                      _currentStep <= 1 ? StepState.editing : StepState.complete,
                      isActive: _currentStep >= 1,

                    ),
                    Step(
                      title: Text("Task-3"),
                      content: Container(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Form(
                          key: form_Key, //key for form
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height:height*0.04),
                                Center(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                        child:Center(child: Text(
                                          ' votre avis ',
                                          style: FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context).tertiaryColor,
                                          ),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height:height*0.04),

                                TextFormField(
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                            SizedBox(height:20),
                            MaterialButton(
                                onPressed:(){
                              Firebaseservice().inputData();
                                },
                                child:const Text("Insert Data in Collection"),
                            color:Colors.blueGrey,
                            textColor:Colors.white,
                            minWidth:300,
                            height:50,
                             // MaterialButton
                        ),
                          Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                  child: Text(
                                    ' \'ps: nous allons consulter votre réclamation le\n  plus-tot possible . ',
                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context).grayLight,
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        _formKey.currentState.save();}

                                      if (textController1.text.trim() != null
                                          &&_selectedLocation!= null
                                          && dateinput1.text.trim() != null
                                          && _type != null

                                      ) {


                                        Navigator.of(context).pop();
                                        Map<String, dynamic>data = {
                                          "discrition": textController1.text
                                              .trim(),
                                          "parking": _selectedLocation,
                                          "date": dateinput1.text,
                                          "type": _type,
                                        };
                                        FirebaseFirestore.instance.collection(
                                            "réclamation_park").add(data);
                                        // Validate will return true if the form is valid, or false if
                                        // the form is invalid.
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ExistsPage(),
                                          ),
                                        );

                                      };


                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.


                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.


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


                              ]
                          ),
                        ),
                      ),
                      state: StepState.complete,
                      isActive:_currentStep >= 2,


                    ),


                  ],

                  controlsBuilder: (BuildContext context, ControlsDetails details)=>Container(),
                ),         )
              ), ]
        )
    );}
}

