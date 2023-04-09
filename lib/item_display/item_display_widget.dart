import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/log_message/log_message_widget.dart';
import '/send_email/send_email_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'item_display_model.dart';
export 'item_display_model.dart';

class ItemDisplayWidget extends StatefulWidget {
  const ItemDisplayWidget({
    Key? key,
    this.types,
    this.itemName,
    this.itemRef,
    this.actionName,
    this.groupsRef,
    this.logRef,
  }) : super(key: key);

  final DocumentReference? types;
  final String? itemName;
  final DocumentReference? itemRef;
  final ActionsRecord? actionName;
  final DocumentReference? groupsRef;
  final DocumentReference? logRef;

  @override
  _ItemDisplayWidgetState createState() => _ItemDisplayWidgetState();
}

class _ItemDisplayWidgetState extends State<ItemDisplayWidget> {
  late ItemDisplayModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemDisplayModel());
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

    return StreamBuilder<List<ScannedItemsRecord>>(
      stream: queryScannedItemsRecord(
        singleRecord: true,
      ),
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
        List<ScannedItemsRecord> itemDisplayScannedItemsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final itemDisplayScannedItemsRecord =
            itemDisplayScannedItemsRecordList.isNotEmpty
                ? itemDisplayScannedItemsRecordList.first
                : null;
        final veriablesLength = itemDisplayScannedItemsRecord!.variables!.length;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFEAEAEA),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              valueOrDefault<String>(
                widget.itemName,
                'itemName',
              ),
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Urbanist',
                    color: Color(0xFF28681F),
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Date added:',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                itemDisplayScannedItemsRecord!.dateAdded!
                                    .toString(),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(currentUserReference!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final rowUsersRecord = snapshot.data!;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Owner:',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                rowUsersRecord.displayName!,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: StreamBuilder<List<ActionsRecord>>(
                      stream: queryActionsRecord(
                        parent: widget.types,
                        queryBuilder: (actionsRecord) =>
                            actionsRecord.whereArrayContainsAny(
                                'checks',
                                itemDisplayScannedItemsRecord!.variables!
                                    .toList()),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<ActionsRecord> listViewActionsRecordList = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewActionsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewActionsRecord = listViewActionsRecordList[listViewIndex];

                          // Add embedded query here
                          return StreamBuilder<List<GroupsRecord>>(
                            stream: queryGroupsRecord(
                              parent: widget.types,
                              queryBuilder: (groupsRecord) =>
                                  groupsRecord.where('users', arrayContains: currentUserReference),
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primaryColor,
                                );
                              }
                              // final groupDocs = snapshot.data!;
                              List<GroupsRecord> groupsRecordList = snapshot.data!;
                              if (snapshot.data!.isEmpty){
                                return Container();
                              }
                              final listViewGroupsRecord = groupsRecordList.isNotEmpty
                                    ? groupsRecordList.first
                                    : null;

                              bool userPresent = false;
                              for (final document in groupsRecordList) {
                                    final docReference = document.reference;
                                    if (listViewActionsRecord.groups!.contains(docReference)) {
                                      userPresent = true;
                                      break;
                                    }
                              }

                            bool allChecksPresent = listViewActionsRecord.checks!.every((element) => itemDisplayScannedItemsRecord!.variables!.contains(element));
                            // allChecksPresent = false;
                            return Visibility(
                              visible: allChecksPresent && userPresent,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 5.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (listViewActionsRecord.commands.addLog!) {
                                      final logsCreateData = createLogsRecordData(
                                        action: listViewActionsRecord.actionName,
                                        user: currentUserReference,
                                        // 'time_created': FieldValue.serverTimestamp(),
                                      );
                                      var logsRecordReference =
                                          LogsRecord.createDoc(itemDisplayScannedItemsRecord!.reference);
                                      await logsRecordReference.set(logsCreateData);
                                      _model.logRef =
                                          LogsRecord.getDocumentFromData(logsCreateData, logsRecordReference);
                                    }
                                    if (listViewActionsRecord.commands.customLog!) {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LogMessageWidget(
                                            logRef: _model.logRef!.reference,
                                          ),
                                        ),
                                      );
                                    }
                                    if (listViewActionsRecord.commands.sendEmail!) {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SendEmailWidget(
                                          ),
                                        ),
                                      );
                                    }
                                    final addVarLength = listViewActionsRecord.commands.addVar?.length ?? 0;
                                    if ( addVarLength > 0) {
                                      print("items in addVar = $addVarLength");
                                      final scannedItemsUpdateData1 = {
                                      'variables': FieldValue.arrayUnion(
                                          [listViewActionsRecord.commands.addVar?.toList()?.first]),
                                      };
                                      // print(listViewActionsRecord.commands.addVar?.toList()?.first);
                                      await widget.itemRef?.update(scannedItemsUpdateData1);
                                    }
      
                                    // final scannedItemsUpdateData2 = {
                                    //   'variables': FieldValue.arrayRemove(
                                    //       [listViewActionsRecord.commands.removeVar?.toList()?.first]),
                                    // };
                                    // await widget.itemRef!.update(scannedItemsUpdateData2);
                                    setState(() {});
                                  },
                                  text: listViewActionsRecord.actionName!,
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: Colors.white,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            );
                      },);},
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