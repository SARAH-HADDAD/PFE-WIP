
import 'package:flutter/material.dart';
import 'package:smart_parking/flutter_flow/flutter_flow_theme.dart';




class confirmWidget extends StatefulWidget {
  const confirmWidget ({Key key}) : super(key: key);

  @override
  _confirWidgetState createState() =>  _confirWidgetState();
}

class _confirWidgetState extends State<confirmWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
    automaticallyImplyLeading: false,
    title: Center(
      child: Text(
    'confirmation  ',
    style: FlutterFlowTheme.of(context).title2.override(
    fontFamily: 'Lexend Deca',
    color: FlutterFlowTheme.of(context).primaryColor,
    fontSize: 22,
    ),
    ),),
    actions: [],
    centerTitle: true,
    elevation: 2,
    ),
    backgroundColor: FlutterFlowTheme.of(context).customColor1,
    body: GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: Align(
    alignment: AlignmentDirectional(0, 0),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Padding(padding: EdgeInsetsDirectional.fromSTEB(30, 10, 14, 6),
    child: Center(
    child: Image.asset(
    'assets/images/confirmer.png',
    width: 250,
    height: 250,
    fit: BoxFit.fill,
    ),),),
       Padding(
    padding: EdgeInsetsDirectional.fromSTEB(30, 10, 14, 6),
    child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(height:height*0.04),
    Center(
    child:
    Text(
    'votre formulaire à bien été envoyé on \n on vous remercie pour votre dévouement ',
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
    ),
    ],
    ),
    ),
    ],
    ),
    ),),
    );
  }
}
