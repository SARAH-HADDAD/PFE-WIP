
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_theme.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_widgets.dart';

import '../generateqecode.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class MyShapePathProvider extends NeumorphicPathProvider {
  @override
  bool shouldReclip(NeumorphicPathProvider oldClipper) {
    return true;
  }

  @override
  Path getPath(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width/2, 0)
      ..lineTo(size.width, size.height/2)
      ..lineTo(size.width/2, size.height/2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  // TODO: implement oneGradientPerPath
  bool get oneGradientPerPath => throw UnimplementedError();
}
class _MyPageState extends State<MyPage> {
  List<String> _locations = ['femme', 'Homme']; // Option 2 String _selectedLocation;
  TextEditingController sampledata1=new TextEditingController();
  TextEditingController sampledata2=new TextEditingController();
  TextEditingController sampledata3=new TextEditingController();
  TextEditingController sampledata4=new TextEditingController();
  TextEditingController sampledata5=new TextEditingController();
  TextEditingController sampledata6=new TextEditingController();
  TextEditingController sampledata7=new TextEditingController();
  TextEditingController sampledata8=new TextEditingController();
  TextEditingController sampledata9=new TextEditingController();
  String uploadedFileUrl = '';
 static String  message='';




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
  String   date_de_reservation = '';

  TextEditingController timeinput = TextEditingController();TextEditingController timeinput1 = TextEditingController();
  @override

  void initState() {
    dateinput1.text = "";
    dateinput2.text= "";
    timeinput.text = ""; timeinput1.text = "";//set the initial value of text field
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
            'Réserver une place de parking',
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
        body: SafeArea(
        child: Align(
        alignment: AlignmentDirectional(0, 0),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Image.asset(
    'assets/images/reserver.png',
    width: 250,
    height: 250,
    fit: BoxFit.fill,
    ),
         Column(
            children: [

                        Form(
                          key: _formKey, //key for form
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                                        child: Text(
                                          'réserver votre place conducteur  \' . ',
                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context).grayLight,
                                          ),
                                        ),
                                      ),
                                      TextField(
                                        controller: timeinput1, //editing controller of this TextField
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'heure fin ',
                                          labelStyle:
                                          FlutterFlowTheme.of(context).bodyText1.override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF95A1AC),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          hintText: 'heure du debut de réservation ...',
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
                                              width: 0,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFDBE2E7),
                                              width: 0,
                                            ),
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          filled: true,
                                          fillColor: Color(0xFFF4F4F4),
                                          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal:20.0),
                                          prefixIcon: Icon(
                                            Icons.timer_sharp,
                                            color: Color(0xFF6C63FF),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF4E4E4E),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        readOnly: true,  //set it true, so that user will not able to edit text
                                        onTap: () async {
                                          TimeOfDay pickedTime =  await showTimePicker(
                                            initialTime: TimeOfDay.now(),
                                            context: context,
                                          );

                                          if(pickedTime != null ){
                                            print(pickedTime.format(context));   //output 10:51 PM
                                            DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                            //converting to DateTime so that we can further format on different pattern.
                                            print(parsedTime); //output 1970-01-01 22:53:00.000
                                            String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                            print(formattedTime); //output 14:59:00
                                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                                            setState(() {
                                              timeinput.text = formattedTime; //set the value of text field.
                                            });
                                          }else{
                                            print("Time is not selected");
                                          }
                                        },
                                      ),

                                      SizedBox(height:height*0.02),


            TextField(
              controller: timeinput, //editing controller of this TextField
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'heure debut ',
                  labelStyle:
                  FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Color(0xFF95A1AC),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  hintText: 'heure du debut de réservation ...',
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
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFDBE2E7),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF4F4F4),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal:20.0),
                  prefixIcon: Icon(
                    Icons.timer_sharp,
                    color: Color(0xFF6C63FF),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF4E4E4E),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              readOnly: true,  //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay pickedTime =  await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if(pickedTime != null ){
                  print(pickedTime.format(context));   //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  print(parsedTime); //output 1970-01-01 22:53:00.000
                  String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    timeinput.text = formattedTime; //set the value of text field.
                  });
                }else{
                  print("Time is not selected");
                }
              },
            ),

                                SizedBox(height:height*0.02),
                                TextField(

                                  controller: dateinput1, //editing controller of this TextField
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal:20.0),
                                    labelText: 'date de réservation ',
                                    labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintText: 'Entrez la date de reservation ...',
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
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFF4F4F4),

                                    prefixIcon: Icon(
                                      Icons.calendar_today_outlined,
                                      color: Color(0xFF6C63FF),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF4E4E4E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  onChanged: (value) => date_de_reservation = value,

                                  readOnly: true,  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime pickedDate = await showDatePicker(
                                        context: context, initialDate: DateTime.now(),
                                        firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
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

                                SizedBox(height:height*0.02),

                                Row(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:[




                                      FFButtonWidget(
                                        onPressed: () {
    if (_formKey.currentState.validate()) {
    _formKey.currentState.save();

    final String nom =dateinput1.text;
    final String heure =timeinput.text;
    final String date =sampledata1.text;
    // If the form is valid, display a snackbar. In the real world,
    // you'd often call a server or save the information in a database.
    message =
    'date de resevation : $nom \nheure:$heure\n username : $date';
    final snackBar = SnackBar(
    content: Text(
    message,
    style: TextStyle(fontSize: 20),
    ),

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).push(MaterialPageRoute(
    //builder:(context)=>GeneratePage(value:message),
    ));
    if (_formKey.currentState.validate()) {
    // If the form is valid, display a snackbar. In the real world,
    // you'd often call a server or save the information in a database.
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Processing Data')),
    );
    Map<String,dynamic>data={"nom et prénom": sampledata1.text,"qrdata ": message,"heure debut  ": timeinput.text,"date de reservation ": dateinput1.text,
    };
    FirebaseFirestore.instance.collection("reservation").add(data);

    // the form is invalid.
    }
    }




                                        },
                                        text: 'confirmer  ',
                                        options: FFButtonOptions(
                                          width: 230,
                                          height: 50,
                                          color: Color(0xFF6C63FF),
                                          textStyle: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context).customColor1,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          elevation: 3,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                          borderRadius: 30,
                                        ),
                                      ),

                              ]



                                ),


                                // height: 50,




                              ]

                          ),
                        ),




]
                      ),


                        ),    ]
                          ),
        ]
                        ),
                      ),

        ) );

                  }
}
