// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_items_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ScannedItemsRecord> _$scannedItemsRecordSerializer =
    new _$ScannedItemsRecordSerializer();

class _$ScannedItemsRecordSerializer
    implements StructuredSerializer<ScannedItemsRecord> {
  @override
  final Iterable<Type> types = const [ScannedItemsRecord, _$ScannedItemsRecord];
  @override
  final String wireName = 'ScannedItemsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ScannedItemsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateAdded;
    if (value != null) {
      result
        ..add('dateAdded')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.typeRef;
    if (value != null) {
      result
        ..add('typeRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.qrID;
    if (value != null) {
      result
        ..add('qrID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.variables;
    if (value != null) {
      result
        ..add('variables')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ScannedItemsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ScannedItemsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dateAdded':
          result.dateAdded = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'typeRef':
          result.typeRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'qrID':
          result.qrID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
          case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'variables':
          result.variables.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ScannedItemsRecord extends ScannedItemsRecord {
  @override
  final String? name;
  @override
  final DateTime? dateAdded;
  @override
  final DocumentReference<Object?>? typeRef;
  @override
  final String? qrID;
  @override
  final String? message;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final BuiltList<String>? variables;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ScannedItemsRecord(
          [void Function(ScannedItemsRecordBuilder)? updates]) =>
      (new ScannedItemsRecordBuilder()..update(updates))._build();

  _$ScannedItemsRecord._(
      {this.name,
      this.dateAdded,
      this.typeRef,
      this.qrID,
      this.message,
      this.type,
      this.owner,
      this.variables,
      this.ffRef})
      : super._();

  @override
  ScannedItemsRecord rebuild(
          void Function(ScannedItemsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScannedItemsRecordBuilder toBuilder() =>
      new ScannedItemsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScannedItemsRecord &&
        name == other.name &&
        dateAdded == other.dateAdded &&
        typeRef == other.typeRef &&
        qrID == other.qrID &&
        message == other.message &&
        type == other.type &&
        owner == other.owner &&
        variables == other.variables &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc( $jc(
                        $jc($jc($jc(0, name.hashCode), dateAdded.hashCode),
                            typeRef.hashCode),
                        qrID.hashCode),
                        message.hashCode),
                    type.hashCode),
                owner.hashCode),
            variables.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ScannedItemsRecord')
          ..add('name', name)
          ..add('dateAdded', dateAdded)
          ..add('typeRef', typeRef)
          ..add('qrID', qrID)
          ..add('message', message)
          ..add('type', type)
          ..add('owner', owner)
          ..add('variables', variables)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ScannedItemsRecordBuilder
    implements Builder<ScannedItemsRecord, ScannedItemsRecordBuilder> {
  _$ScannedItemsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DateTime? _dateAdded;
  DateTime? get dateAdded => _$this._dateAdded;
  set dateAdded(DateTime? dateAdded) => _$this._dateAdded = dateAdded;

  DocumentReference<Object?>? _typeRef;
  DocumentReference<Object?>? get typeRef => _$this._typeRef;
  set typeRef(DocumentReference<Object?>? typeRef) => _$this._typeRef = typeRef;

  String? _qrID;
  String? get qrID => _$this._qrID;
  set qrID(String? qrID) => _$this._qrID = qrID;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  ListBuilder<String>? _variables;
  ListBuilder<String> get variables =>
      _$this._variables ??= new ListBuilder<String>();
  set variables(ListBuilder<String>? variables) =>
      _$this._variables = variables;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ScannedItemsRecordBuilder() {
    ScannedItemsRecord._initializeBuilder(this);
  }

  ScannedItemsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _dateAdded = $v.dateAdded;
      _typeRef = $v.typeRef;
      _qrID = $v.qrID;
      _message = $v.message;
      _type = $v.type;
      _owner = $v.owner;
      _variables = $v.variables?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScannedItemsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScannedItemsRecord;
  }

  @override
  void update(void Function(ScannedItemsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ScannedItemsRecord build() => _build();

  _$ScannedItemsRecord _build() {
    _$ScannedItemsRecord _$result;
    try {
      _$result = _$v ??
          new _$ScannedItemsRecord._(
              name: name,
              dateAdded: dateAdded,
              typeRef: typeRef,
              qrID: qrID,
              message: message,
              type: type,
              owner: owner,
              variables: _variables?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'variables';
        _variables?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ScannedItemsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
