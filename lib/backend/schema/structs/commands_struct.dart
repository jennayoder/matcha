import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'commands_struct.g.dart';

abstract class CommandsStruct
    implements Built<CommandsStruct, CommandsStructBuilder> {
  static Serializer<CommandsStruct> get serializer =>
      _$commandsStructSerializer;

  bool? get addLog;

  bool? get customLog;

  bool? get sendEmail;

  BuiltList<String>? get addVar;

  BuiltList<String>? get removeVar;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CommandsStructBuilder builder) => builder
    ..addLog = false
    ..customLog = false
    ..sendEmail = false
    ..addVar = ListBuilder()
    ..removeVar = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  CommandsStruct._();
  factory CommandsStruct([void Function(CommandsStructBuilder) updates]) =
      _$CommandsStruct;
}

CommandsStruct createCommandsStruct({
  bool? addLog,
  bool? customLog,
  bool? sendEmail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommandsStruct(
      (c) => c
        ..addLog = addLog
        ..customLog = customLog
        ..sendEmail = sendEmail
        ..addVar = null
        ..removeVar = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CommandsStruct? updateCommandsStruct(
  CommandsStruct? commands, {
  bool clearUnsetFields = true,
}) =>
    commands != null
        ? (commands.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addCommandsStructData(
  Map<String, dynamic> firestoreData,
  CommandsStruct? commands,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commands == null) {
    return;
  }
  if (commands.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && commands.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commandsData = getCommandsFirestoreData(commands, forFieldValue);
  final nestedData = commandsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = commands.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCommandsFirestoreData(
  CommandsStruct? commands, [
  bool forFieldValue = false,
]) {
  if (commands == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(CommandsStruct.serializer, commands);

  // Add any Firestore field values
  commands.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommandsListFirestoreData(
  List<CommandsStruct>? commandss,
) =>
    commandss?.map((c) => getCommandsFirestoreData(c, true)).toList() ?? [];
