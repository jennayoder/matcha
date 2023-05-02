import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'scanned_items_record.g.dart';

abstract class ScannedItemsRecord
    implements Built<ScannedItemsRecord, ScannedItemsRecordBuilder> {
  static Serializer<ScannedItemsRecord> get serializer =>
      _$scannedItemsRecordSerializer;

  String? get name;

  DateTime? get dateAdded;

  DocumentReference? get typeRef;

  String? get qrID;

  String? get message;


  String? get type;

  DocumentReference? get owner;

  BuiltList<String>? get variables;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ScannedItemsRecordBuilder builder) => builder
    ..name = ''
    ..qrID = ''
    ..message = ''
    ..type = ''
    ..variables = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ScannedItems');

  static Stream<ScannedItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ScannedItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ScannedItemsRecord._();
  factory ScannedItemsRecord(
          [void Function(ScannedItemsRecordBuilder) updates]) =
      _$ScannedItemsRecord;

  static ScannedItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createScannedItemsRecordData({
  String? name,
  DateTime? dateAdded,
  DocumentReference? typeRef,
  String? qrID,
  String? message,
  String? type,
  DocumentReference? owner,
}) {
  final firestoreData = serializers.toFirestore(
    ScannedItemsRecord.serializer,
    ScannedItemsRecord(
      (s) => s
        ..name = name
        ..dateAdded = dateAdded
        ..typeRef = typeRef
        ..qrID = qrID
        ..message = message
        ..type = type
        ..owner = owner
        ..variables = null,
    ),
  );

  return firestoreData;
}
