import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditActionsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for actionName widget.
  TextEditingController? actionNameController;
  String? Function(BuildContext, String?)? actionNameControllerValidator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue1;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue2;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue3;
  // State field(s) for newVariable widget.
  TextEditingController? newVariableController;
  String? Function(BuildContext, String?)? newVariableControllerValidator;
  // State field(s) for addVar widget.
  TextEditingController? addVarController;
  String? Function(BuildContext, String?)? addVarControllerValidator;
  // State field(s) for removeVar widget.
  TextEditingController? removeVarController;
  String? Function(BuildContext, String?)? removeVarControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    actionNameController?.dispose();
    newVariableController?.dispose();
    addVarController?.dispose();
    removeVarController?.dispose();
  }

  /// Additional helper methods are added here.

}
