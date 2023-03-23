import '/add_item/add_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for itemQR widget.
  TextEditingController? itemQRController;
  String? Function(BuildContext, String?)? itemQRControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    itemQRController?.dispose();
  }

  /// Additional helper methods are added here.

}
