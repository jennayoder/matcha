import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for logMessage widget.
  TextEditingController? logMessageController;
  String? Function(BuildContext, String?)? logMessageControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    logMessageController?.dispose();
  }

  /// Additional helper methods are added here.

}
