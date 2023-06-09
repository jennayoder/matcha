import '/actions/actions_widget.dart';
import '/auth/auth_util.dart';
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

import 'edit_type_model.dart';
export 'edit_type_model.dart';

class EditTypeWidget extends StatefulWidget {
  const EditTypeWidget({
    Key? key,
    String? typeName,
    this.groupRef,
    this.groupName,
    this.typeRef,
  })  : this.typeName = typeName ?? 'Type',
        super(key: key);

  final String typeName;
  final DocumentReference? groupRef;
  final String? groupName;
  final DocumentReference? typeRef;

  @override
  _EditTypeWidgetState createState() => _EditTypeWidgetState();
}

class _EditTypeWidgetState extends State<EditTypeWidget> {
  late EditTypeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTypeModel());

    _model.initVarsController ??= TextEditingController();

  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
          title: StreamBuilder<TypeRecord>(
            stream: TypeRecord.getDocument(widget.typeRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                );
              }
              final textTypeRecord = snapshot.data!;
              return Text(
                textTypeRecord.typeName!,
                style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
              );
            },
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                              child: Text(
                                'Create groups of users you want to have access to this type. Hold down on a group to delete it.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context).darkText,
                                      fontSize: 15,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<List<GroupsRecord>>(
                      stream: queryGroupsRecord(
                        parent: widget.typeRef,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<GroupsRecord> columnGroupsRecordList = snapshot.data!;
                        return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnGroupsRecordList.length, (columnIndex) {

                            final listViewGroupsRecord =
                                columnGroupsRecordList[columnIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16, 5, 16, 5),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UsersWidget(
                                        groupRef: listViewGroupsRecord.reference,
                                        groupName: listViewGroupsRecord.groupName,
                                        typeRef: widget.typeRef,
                                      ),
                                    ),
                                  );
                                },
                                onLongPress: () async {
                                  await listViewGroupsRecord.reference.delete();
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x411D2429),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 4, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listViewGroupsRecord.groupName!,
                                                  style: FlutterFlowTheme.of(context)
                                                      .title3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                  0, 7, 0, 0),
                                              child: Icon(
                                                Icons.chevron_right_rounded,
                                                color: Color(0xFF57636C),
                                                size: 24,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  final groupsCreateData = createGroupsRecordData(
                                    groupName: 'New Group',
                                  );
                                  await GroupsRecord.createDoc(widget.typeRef!)
                                      .set(groupsCreateData);
                                },
                                text: 'Add Group',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Urbanist',
                                            color: Colors.white,
                                          ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 40, 15, 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Enter the variables each item is initalized with:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context).darkText,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                    child: TextFormField(
                                      controller: _model.initVarsController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Add init variables',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Urbanist',
                                              fontSize: 14,
                                            ),
                                        hintText: 'Enter item here',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Urbanist',
                                              fontSize: 12,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color:
                                                FlutterFlowTheme.of(context).lineGray,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16, 18, 0, 18),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Urbanist',
                                            fontSize: 14,
                                          ),
                                      validator: _model.initVarsControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 60,
                                  icon: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    final typeUpdateData = {
                                      'initVars': FieldValue.arrayUnion([_model.initVarsController.text]),
                                    };
                                    await widget.typeRef!.update(typeUpdateData);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: StreamBuilder<TypeRecord>(
                              stream: TypeRecord.getDocument(widget.typeRef!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context).primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final columnTypeRecord = snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final initVars =
                                        columnTypeRecord.initVars!.toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(initVars.length,
                                          (initVarsIndex) {
                                        final initVarsItem = initVars[initVarsIndex];
                                        return Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              15, 0, 15, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onLongPress: () async {
                                                    final typeUpdateData = {
                                                      'initVars':
                                                          FieldValue.arrayRemove(
                                                              [initVarsItem]),
                                                    };
                                                    await widget.typeRef!
                                                        .update(typeUpdateData);
                                                  },
                                                  child: Card(
                                                    clipBehavior:
                                                        Clip.antiAliasWithSaveLayer,
                                                    color:
                                                        FlutterFlowTheme.of(context)
                                                            .secondaryBackground,
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(10, 5, 10, 5),
                                                      child: Text(
                                                        initVarsItem,
                                                        style: FlutterFlowTheme.of(
                                                                context)
                                                            .subtitle2
                                                            .override(
                                                              fontFamily: 'Urbanist',
                                                              color:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              fontSize: 18,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(100, 0, 100, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ActionsWidget(
                                        typeRef: widget.typeRef,
                                      ),
                                    ),
                                  );
                                },
                                text: 'Actions',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                        fontFamily: 'Urbanist',
                                        color: Colors.white,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(80, 0, 80, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          NavBarPage(initialPage: 'typesPage'),
                                    ),
                                  );
                                },
                                text: 'Done',
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding:
                                      EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.of(context).subtitle2.override(
                                            fontFamily: 'Urbanist',
                                            color: Colors.white,
                                          ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],),),],
          ),
        ),
       ), ),
    );
  }
}
