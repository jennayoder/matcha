import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'type_record.g.dart';

abstract class TypeRecord implements Built<TypeRecord, TypeRecordBuilder> {
  static Serializer<TypeRecord> get serializer => _$typeRecordSerializer;

  DocumentReference? get owner;

  @BuiltValueField(wireName: 'users_assigned')
  BuiltList<DocumentReference>? get usersAssigned;

  String? get description;

  @BuiltValueField(wireName: 'last_edited')
  DateTime? get lastEdited;

  @BuiltValueField(wireName: 'time_created')
  DateTime? get timeCreated;

  String? get typeName;

  BuiltList<String>? get initVars;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TypeRecordBuilder builder) => builder
    ..usersAssigned = ListBuilder()
    ..description = ''
    ..typeName = ''
    ..initVars = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('type');

  static Stream<TypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TypeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TypeRecord._();
  factory TypeRecord([void Function(TypeRecordBuilder) updates]) = _$TypeRecord;

  static TypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTypeRecordData({
  DocumentReference? owner,
  String? description,
  DateTime? lastEdited,
  DateTime? timeCreated,
  String? typeName,
}) {
  final firestoreData = serializers.toFirestore(
    TypeRecord.serializer,
    TypeRecord(
      (t) => t
        ..owner = owner
        ..usersAssigned = null
        ..description = description
        ..lastEdited = lastEdited
        ..timeCreated = timeCreated
        ..typeName = typeName
        ..initVars = null,
    ),
  );

  return firestoreData;
}
