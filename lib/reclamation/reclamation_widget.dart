import 'package:smart_parking/FORMULAIRE/Form.dart';
import 'package:smart_parking/FORMULAIRE/objets_perdu.dart';
import 'package:smart_parking/FORMULAIRE/obejets_trouver.dart';
import 'package:smart_parking/components/feed.dart';
import 'package:smart_parking/ratepark/ratepark_widget.dart';


import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ReclamationWidget extends StatefulWidget {
  const ReclamationWidget({Key key}) : super(key: key);

  @override
  _ReclamationWidgetState createState() => _ReclamationWidgetState();
}

class _ReclamationWidgetState extends State<ReclamationWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'RÉCLAMATION',
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
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
                          'smart_parkingmer un souci \npar rapport au parking',
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
                                  builder: (context) => form()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 30),
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
                          'smart_parkingmer un souci\npar rapport à l\'application',
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
                                  builder: (context) => App()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 30),
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
                          'Déclarer un objet perdu',
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
                                  builder: (context) =>  forom3()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
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
                          'Signlaer un objet trouvé',
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
                                  builder: (context) => forom2()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
