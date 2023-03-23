import '/edit_type/edit_type_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditStateModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for stateName widget.
  TextEditingController? stateNameController;
  String? Function(BuildContext, String?)? stateNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    stateNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
