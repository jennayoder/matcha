import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'edit_actions_model.dart';
export 'edit_actions_model.dart';

class EditActionsWidget extends StatefulWidget {
  const EditActionsWidget({
    Key? key,
    this.typeUsers,
    this.groupRef,
    this.groupName,
    this.typeRef,
    this.groupsDocs,
    this.actionRef,
  }) : super(key: key);

  final DocumentReference? typeUsers;
  final DocumentReference? groupRef;
  final String? groupName;
  final DocumentReference? typeRef;
  final GroupsRecord? groupsDocs;
  final DocumentReference? actionRef;

  @override
  _EditActionsWidgetState createState() => _EditActionsWidgetState();
}

class _EditActionsWidgetState extends State<EditActionsWidget> {
  late EditActionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditActionsModel());

    _model.newVariableController ??= TextEditingController();
    _model.addVarController ??= TextEditingController();
    _model.removeVarController ??= TextEditingController();
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

    return StreamBuilder<ActionsRecord>(
      stream: ActionsRecord.getDocument(widget.actionRef!),
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
        final editActionsActionsRecord = snapshot.data!;
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
              title: Text(
                'Edit Action',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: 'Urbanist',
                      color: Color(0xE273926C),
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
                              child: TextFormField(
                                controller: _model.actionNameController ??=
                                    TextEditingController(
                                  text: editActionsActionsRecord.actionName,
                                ),
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.actionNameController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    final actionsUpdateData =
                                        createActionsRecordData(
                                      actionName:
                                          _model.actionNameController.text,
                                    );
                                    await widget.actionRef!
                                        .update(actionsUpdateData);
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Action Name',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  hintText: 'Enter group name here',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
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
                                          16, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context).title1,
                                validator: _model.actionNameControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                              child: SwitchListTile(
                                value: _model.switchListTileValue1 ??=
                                    editActionsActionsRecord.commands.addLog!,
                                onChanged: (newValue) async {
                                  setState(() => _model.switchListTileValue1 = newValue!);
                                  if (newValue!) {
                                    final actionsUpdateData = createActionsRecordData(
                                      commands: createCommandsStruct(
                                        addLog: true,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await widget.actionRef!.update(actionsUpdateData);
                                  } else {
                                    final actionsUpdateData = createActionsRecordData(
                                      commands: createCommandsStruct(
                                        addLog: false,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await widget.actionRef!.update(actionsUpdateData);
                                  }
                                },
                                title: Text(
                                  'Add Log',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                dense: false,
                                controlAffinity: ListTileControlAffinity.trailing,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                              child: SwitchListTile(
                                value: _model.switchListTileValue2 ??=
                                    editActionsActionsRecord.commands.customLog!,
                                onChanged: (newValue) async {
                                  setState(() => _model.switchListTileValue2 = newValue!);
                                  if (newValue!) {
                                    final actionsUpdateData = createActionsRecordData(
                                      commands: createCommandsStruct(
                                        customLog: true,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await widget.actionRef!.update(actionsUpdateData);
                                  } else {
                                    final actionsUpdateData = createActionsRecordData(
                                      commands: createCommandsStruct(
                                        customLog: false,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await widget.actionRef!.update(actionsUpdateData);
                                  }
                                },
                                title: Text(
                                  'Add Custom Log',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                dense: false,
                                controlAffinity: ListTileControlAffinity.trailing,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                              child: SwitchListTile(
                                value: _model.switchListTileValue3 ??=
                                    editActionsActionsRecord.commands.sendEmail!,
                                onChanged: (newValue) async {
                                  setState(() => _model.switchListTileValue3 = newValue!);
                                  if (newValue!) {
                                    final actionsUpdateData = createActionsRecordData(
                                      commands: createCommandsStruct(
                                        sendEmail: true,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await widget.actionRef!.update(actionsUpdateData);
                                  } else {
                                    final actionsUpdateData = createActionsRecordData(
                                      commands: createCommandsStruct(
                                        sendEmail: false,
                                        clearUnsetFields: false,
                                      ),
                                    );
                                    await widget.actionRef!.update(actionsUpdateData);
                                  }
                                },
                                title: Text(
                                  'Send Email',
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                ),
                                tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                dense: false,
                                controlAffinity: ListTileControlAffinity.trailing,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Text(
                                'Allow access to groups:',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        child: StreamBuilder<List<GroupsRecord>>(
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
                              children: List.generate(columnGroupsRecordList.length, (columnIndex) {
                                final columnGroupsRecord = columnGroupsRecordList[columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                                  child: Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.checkboxListTileValueMap[columnGroupsRecord] ??=
                                          editActionsActionsRecord.groups!
                                              .toList()
                                              .contains(columnGroupsRecord.reference),
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxListTileValueMap[columnGroupsRecord] =
                                                newValue!);
                                        if (newValue!) {
                                          final actionsUpdateData = {
                                            'groups': FieldValue.arrayUnion(
                                                [columnGroupsRecord.reference]),
                                          };
                                          await widget.actionRef!.update(actionsUpdateData);
                                        } else {
                                          final actionsUpdateData = {
                                            'groups': FieldValue.arrayRemove(
                                                [columnGroupsRecord.reference]),
                                          };
                                          await widget.actionRef!.update(actionsUpdateData);
                                        }
                                      },
                                      title: Text(
                                        columnGroupsRecord.groupName!,
                                        style: FlutterFlowTheme.of(context).subtitle2,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                                      activeColor: FlutterFlowTheme.of(context).primaryColor,
                                      dense: false,
                                      controlAffinity: ListTileControlAffinity.trailing,
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Use \'+\' to add items or hold down on an item to delete it.',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Add people to email list:',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Generated code for this DropDown Widget...
                            Expanded(
                              child: StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(),
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
                                  List<UsersRecord> dropDownUsersRecordList = snapshot.data!;
                                  return FlutterFlowDropDown<String>(
                                    controller: _model.dropDownValueController ??=
                                        FormFieldController<String>(null),
                                    options: dropDownUsersRecordList
                                        .map((e) => e.email)
                                        .withoutNulls
                                        .toList()
                                        .toList(),
                                    onChanged: (val) => setState(() => _model.dropDownValue = val),
                                    width: 180,
                                    height: 50,
                                    // searchHintTextStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                    //       fontFamily: '',
                                    //       color: FlutterFlowTheme.of(context).secondaryText,
                                    //     ),
                                    textStyle: FlutterFlowTheme.of(context).subtitle2,
                                    hintText: 'Please select...',
                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    elevation: 2,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0,
                                    borderRadius: 0,
                                    margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                                    hidesUnderline: true,
                                  );
                                },
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
                                final actionsUpdateData = {
                                  'emails': FieldValue.arrayUnion(
                                      [_model.dropDownValue]),
                                };
                                await widget.actionRef!
                                    .update(actionsUpdateData);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Builder(
                          builder: (context) {
                            final emailGroup =
                                editActionsActionsRecord.emails!.toList();
                            return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(emailGroup.length, (emailGroupIndex) {
                              final emailGroupItem = emailGroup[emailGroupIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onLongPress: () async {
                                          final actionsUpdateData = {
                                            'emails': FieldValue.arrayRemove(
                                                [emailGroupItem]),
                                          };
                                          await widget.actionRef!
                                              .update(actionsUpdateData);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 3, 0, 3),
                                            child: Text(
                                              emailGroupItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
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
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Items that must be present for the action to be visible:',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
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
                                  controller: _model.newVariableController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Add Check',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Urbanist',
                                          fontSize: 16,
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
                                        color: FlutterFlowTheme.of(context)
                                            .lineGray,
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
                                  validator: _model
                                      .newVariableControllerValidator
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
                                final actionsUpdateData = {
                                  'checks': FieldValue.arrayUnion(
                                      [_model.newVariableController.text]),
                                };
                                await widget.actionRef!
                                    .update(actionsUpdateData);
                              },
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final checks =
                              editActionsActionsRecord.checks!.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(checks.length, (checksIndex) {
                              final checksItem = checks[checksIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onLongPress: () async {
                                          final actionsUpdateData = {
                                            'checks': FieldValue.arrayRemove(
                                                [checksItem]),
                                          };
                                          await widget.actionRef!
                                              .update(actionsUpdateData);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 3, 0, 3),
                                            child: Text(
                                              checksItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Variables to add when action is selected:',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.addVarController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Add Variable',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                        hintText: 'Enter variable here',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Urbanist',
                                              fontSize: 12,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineGray,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                      validator: _model
                                          .addVarControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      final actionsUpdateData =
                                          createActionsRecordData(
                                        commands: createCommandsStruct(
                                          fieldValues: {
                                            'addVar': FieldValue.arrayUnion(
                                                [_model.addVarController.text]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      );
                                      await widget.actionRef!
                                          .update(actionsUpdateData);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final addVar = editActionsActionsRecord
                                  .commands.addVar
                                  ?.toList()
                                  ?.toList() ??
                              [];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(addVar.length, (addVarIndex) {
                              final addVarItem = addVar[addVarIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onLongPress: () async {
                                          final actionsUpdateData =
                                              createActionsRecordData(
                                            commands: createCommandsStruct(
                                              fieldValues: {
                                                'addVar':
                                                    FieldValue.arrayRemove(
                                                        [addVarItem]),
                                              },
                                              clearUnsetFields: false,
                                            ),
                                          );
                                          await widget.actionRef!
                                              .update(actionsUpdateData);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 3, 0, 3),
                                            child: Text(
                                              addVarItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
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
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Variables to remove when action is selected:',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
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
                              child: TextFormField(
                                controller: _model.removeVarController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Remove Variable',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle2,
                                  hintText: 'Enter variable here',
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
                                style: FlutterFlowTheme.of(context).title1,
                                validator: _model.removeVarControllerValidator
                                    .asValidator(context),
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
                                      final actionsUpdateData =
                                          createActionsRecordData(
                                        commands: createCommandsStruct(
                                          fieldValues: {
                                            'removeVar': FieldValue.arrayUnion(
                                                [_model.removeVarController.text]),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      );
                                      await widget.actionRef!
                                          .update(actionsUpdateData);
                                    },
                            ),
                          ],
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final removeVar = editActionsActionsRecord
                                  .commands.removeVar
                                  ?.toList()
                                  ?.toList() ??
                              [];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children:
                                List.generate(removeVar.length, (removeVarIndex) {
                              final removeVarItem = removeVar[removeVarIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15, 0, 15, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onLongPress: () async {
                                          final actionsUpdateData =
                                              createActionsRecordData(
                                            commands: createCommandsStruct(
                                              fieldValues: {
                                                'removeVar':
                                                    FieldValue.arrayRemove(
                                                        [removeVarItem]),
                                              },
                                              clearUnsetFields: false,
                                            ),
                                          );
                                          await widget.actionRef!
                                              .update(actionsUpdateData);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 3, 0, 3),
                                            child: Text(
                                              removeVarItem,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 20,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
