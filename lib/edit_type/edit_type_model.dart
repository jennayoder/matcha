import '/actions/actions_widget.dart';
// import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/users/users_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditTypeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for initVars widget.
  TextEditingController? initVarsController;
  String? Function(BuildContext, String?)? initVarsControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    initVarsController?.dispose();
  }

  /// Additional helper methods are added here.

}
