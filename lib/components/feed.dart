

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking/FORMULAIRE/firebas.service.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_icon_button.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_theme.dart';



class App extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'feedback',
            style: FlutterFlowTheme.of(context).title2.override(
              fontFamily: 'Lexend Deca',
              color: FlutterFlowTheme.of(context).primaryColor,
              fontSize: 22,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        backgroundColor: FlutterFlowTheme.of(context).customColor1,
        body: Center (
          child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
    child: Align(
    alignment: AlignmentDirectional(0, 0),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
    child: Container(
    width: 90,
    height: 90,
    decoration: BoxDecoration(
    color: FlutterFlowTheme.of(context).customColor1,
    boxShadow: [
    BoxShadow(
    blurRadius: 1,
    color: Color(0xFF1C0527),
    offset: Offset(1, 1),
    spreadRadius: 1,
    )
    ],
    borderRadius: BorderRadius.circular(30),
    border: Border.all(
    color: FlutterFlowTheme.of(context).grayLight,
    ),
    ),
    child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16, 2, 4, 0),
    child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Text(
    'votre feed back',
    textAlign: TextAlign.start,
    style: FlutterFlowTheme.of(context)
        .bodyText1
        .override(
    fontFamily: 'Lexend Deca',
    color:
    FlutterFlowTheme.of(context).secondaryColor,
    fontWeight: FontWeight.w500,
    ),
    ),
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
    child: FlutterFlowIconButton(
    borderColor: Colors.transparent,
    borderRadius: 30,
    buttonSize: 46,
    fillColor: Color(0xFF1C0527),
    icon: Icon(
    Icons.chevron_right_rounded,
    color: Color(0xFFECD6F6),
    size: 20,
    ),
    onPressed: () => Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>FeedbackDialog()),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    ),]),   ),
    ),),);
  }
}


class FeedbackDialog extends StatefulWidget {

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
int n = 0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Enter your feedback here',
            filled: true,
          ),
          maxLines: 5,
          maxLength: 4096,
          textInputAction: TextInputAction.done,
          validator: (String text) {
            if (text == null || text.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'

          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: const Text('Send'),
          onPressed: () async {n=n+1;
 String  nb =n.toString();
            Firebaseservice().addreclamation("users","feedbacks",nb,_controller.text,);
            // Only if the input form is valid (the user has entered text)
            if (_formKey.currentState.validate()) {
              // We will use this var to show the result
              // of this operation to the user
              String message;




                // Write the server's timestamp and the user's feedback


              // Show a snackbar with the result
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(message)));
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}


void addreclamation(name_collection ,name_subcollection, nb, id_user ,variable ) {
  Map<String, dynamic> ourData = {
    "feed": variable,
    "type": "normal",
    "couverte":"false"

  };
  var db =  FirebaseFirestore.instance.collection(name_collection);
  var studentsClassroomRef = db.doc( id_user).collection(name_subcollection);

  studentsClassroomRef
      .doc(nb)
      .set(ourData)
      .then((value) => print("success"));
}

