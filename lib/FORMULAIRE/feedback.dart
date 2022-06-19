
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_theme.dart';





class rate  extends StatefulWidget {
  @override
   _MyPageStatefeedback createState() => _MyPageStatefeedback();
}

class  _MyPageStatefeedback extends State<rate> {
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
        'feedback ',
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
              // Controls the stepper orientation
              Image.asset(
                "assets/images/.svg",
                width: 250,
                height: 250,
                fit: BoxFit.fill,
              ),
                // the Stepper widget
                Container(
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
                                          child:  Text('donnez votre feed back',
                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context).tertiaryColor,),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height:height*0.04),
                                TextFormField(
                                   controller: sampledata3,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      labelText: 'description ',
                                      labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    hintText: 'exprimez vous ...',
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
                                      Icons.person,
                                      color: Color(0xFF6C63FF),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF4E4E4E),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),// Input Decoration// Input Decoration
                                  validator:(value){
                                    if (value.length < 4) {
                                      return 'Enter at least 4 characters';}
                                    if(value.isEmpty ){
                                      return"Enter correct name" ;
                                    } else {
                                      return null;

                                    }
                                  },
                                ),

                                SizedBox(height:height*0.04),
                                RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 23.0,
                                  direction: Axis.horizontal,
                                ),

                                SizedBox(height:height*0.04),

                                Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children:[
                                      NeumorphicButton(
                                        margin:EdgeInsets.only(top:12),

                                        onPressed: () {
                                          // Validate returns true if the form is valid, or false otherwise.
                                          if (_formKey.currentState.validate()) {
                                            _formKey.currentState.save();

                                            // If the form is valid, display a snackbar. In the real world,
                                            // you'd often call a server or save the information in a database.
                                            final message =
                                                'Username: $username\nPassword: $password\nEmail: $email';
                                            final snackBar = SnackBar(
                                              content: Text(
                                                message,
                                                style: TextStyle(fontSize: 20),
                                              ),

                                            );
                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                          }




                                        },




                                        style:NeumorphicStyle(
                                            shape:NeumorphicShape.flat,
                                            boxShape:
                                            NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),

                                            border:NeumorphicBorder()
                                        ),// NeumorphicStyle
                                      ),

                                    ]



                                ),


                                // height: 50,





                              ]

                          ),
                        ),





                      ),


                  ],


                ),)
    ;}
}



