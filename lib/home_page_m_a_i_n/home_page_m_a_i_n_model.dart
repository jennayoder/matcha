import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/edit_type/edit_type_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageMAINModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for typeName widget.
  TextEditingController? typeNameController;
  String? Function(BuildContext, String?)? typeNameControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  TypeRecord? createTypeOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    typeNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
