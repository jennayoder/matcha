import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'amenitity_indicator_model.dart';
export 'amenitity_indicator_model.dart';

class AmenitityIndicatorWidget extends StatefulWidget {
  const AmenitityIndicatorWidget({
    Key? key,
    this.icon,
    this.background,
    this.borderColor,
  }) : super(key: key);

  final Widget? icon;
  final Color? background;
  final Color? borderColor;

  @override
  _AmenitityIndicatorWidgetState createState() =>
      _AmenitityIndicatorWidgetState();
}

class _AmenitityIndicatorWidgetState extends State<AmenitityIndicatorWidget> {
  late AmenitityIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AmenitityIndicatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 44.0,
        height: 44.0,
        decoration: BoxDecoration(
          color: widget.background,
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.borderColor!,
            width: 2.0,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: widget.icon!,
      ),
    );
  }
}
