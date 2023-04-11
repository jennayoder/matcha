import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/edit_type/edit_type_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'users_model.dart';
export 'users_model.dart';

class UsersWidget extends StatefulWidget {
  const UsersWidget({
    Key? key,
    this.typeUsers,
    this.groupRef,
    this.groupName,
    this.typeRef,
    this.groupsDocs,
  }) : super(key: key);

  final DocumentReference? typeUsers;
  final DocumentReference? groupRef;
  final String? groupName;
  final DocumentReference? typeRef;
  final GroupsRecord? groupsDocs;

  @override
  _UsersWidgetState createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  late UsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersModel());
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

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        queryBuilder: (usersRecord) => usersRecord.orderBy('display_name'),
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
        List<UsersRecord> usersUsersRecordList = snapshot.data!;
        return Scaffold(
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
              valueOrDefault<String>(
                widget.groupName,
                'Create a group',
              ),
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
                            child: StreamBuilder<GroupsRecord>(
                              stream: GroupsRecord.getDocument(widget.groupRef!),
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
                                final groupNameGroupsRecord = snapshot.data!;
                                return TextFormField(
                                  controller: _model.groupNameController ??= TextEditingController(
                                    text: groupNameGroupsRecord.groupName,
                                  ),
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.groupNameController',
                                    Duration(milliseconds: 2000),
                                    () async {
                                      final groupsUpdateData = createGroupsRecordData(
                                        groupName: _model.groupNameController.text,
                                      );
                                      await widget.groupRef!.update(groupsUpdateData);
                                    },
                                  ),
                                  onFieldSubmitted: (_) async {
                                    final groupsUpdateData = createGroupsRecordData(
                                      groupName: groupNameGroupsRecord.groupName,
                                    );
                                    await widget.groupRef!.update(groupsUpdateData);
                                  },
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Group',
                                    labelStyle: FlutterFlowTheme.of(context).subtitle2,
                                    hintText: 'Enter group name here',
                                    hintStyle: FlutterFlowTheme.of(context).subtitle2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context).lineGray,
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
                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                    contentPadding: EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context).subtitle2,
                                  validator: _model.groupNameControllerValidator.asValidator(context),
                                );
                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> listViewUsersRecordList =
                            snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewUsersRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewUsersRecord =
                                listViewUsersRecordList[listViewIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: StreamBuilder<GroupsRecord>(
                                stream:
                                    GroupsRecord.getDocument(widget.groupRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final checkboxListTileGroupsRecord =
                                      snapshot.data!;
                                  return Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor: Color(0xFF95A1AC),
                                    ),
                                    child: CheckboxListTile(
                                      value: _model.checkboxListTileValueMap[
                                              listViewUsersRecord] ??=
                                          checkboxListTileGroupsRecord.users!
                                              .toList()
                                              .contains(listViewUsersRecord
                                                  .reference),
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                                .checkboxListTileValueMap[
                                            listViewUsersRecord] = newValue!);
                                        if (newValue!) {
                                          final groupsUpdateData = {
                                            'users': FieldValue.arrayUnion([
                                              listViewUsersRecord.reference
                                            ]),
                                          };
                                          await widget.groupRef!
                                              .update(groupsUpdateData);
                                        } else {
                                          final groupsUpdateData = {
                                            'users': FieldValue.arrayRemove([
                                              listViewUsersRecord.reference
                                            ]),
                                          };
                                          await widget.groupRef!
                                              .update(groupsUpdateData);
                                        }
                                      },
                                      title: Text(
                                        listViewUsersRecord.displayName!,
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                      tileColor: Color(0xFFF5F5F5),
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
