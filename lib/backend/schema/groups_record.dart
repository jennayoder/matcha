import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'groups_record.g.dart';

abstract class GroupsRecord
    implements Built<GroupsRecord, GroupsRecordBuilder> {
  static Serializer<GroupsRecord> get serializer => _$groupsRecordSerializer;

  BuiltList<DocumentReference>? get users;

  String? get groupName;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(GroupsRecordBuilder builder) => builder
    ..users = ListBuilder()
    ..groupName = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('groups')
          : FirebaseFirestore.instance.collectionGroup('groups');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('groups').doc();

  static Stream<GroupsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<GroupsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  GroupsRecord._();
  factory GroupsRecord([void Function(GroupsRecordBuilder) updates]) =
      _$GroupsRecord;

  static GroupsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createGroupsRecordData({
  String? groupName,
}) {
  final firestoreData = serializers.toFirestore(
    GroupsRecord.serializer,
    GroupsRecord(
      (g) => g
        ..users = null
        ..groupName = groupName,
    ),
  );

  return firestoreData;
}
