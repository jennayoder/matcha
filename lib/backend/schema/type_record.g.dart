// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TypeRecord> _$typeRecordSerializer = new _$TypeRecordSerializer();

class _$TypeRecordSerializer implements StructuredSerializer<TypeRecord> {
  @override
  final Iterable<Type> types = const [TypeRecord, _$TypeRecord];
  @override
  final String wireName = 'TypeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TypeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.usersAssigned;
    if (value != null) {
      result
        ..add('users_assigned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastEdited;
    if (value != null) {
      result
        ..add('last_edited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.timeCreated;
    if (value != null) {
      result
        ..add('time_created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.typeName;
    if (value != null) {
      result
        ..add('typeName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.initVars;
    if (value != null) {
      result
        ..add('initVars')
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
  TypeRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TypeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'users_assigned':
          result.usersAssigned.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_edited':
          result.lastEdited = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'time_created':
          result.timeCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'typeName':
          result.typeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'initVars':
          result.initVars.replace(serializers.deserialize(value,
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

class _$TypeRecord extends TypeRecord {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final BuiltList<DocumentReference<Object?>>? usersAssigned;
  @override
  final String? description;
  @override
  final DateTime? lastEdited;
  @override
  final DateTime? timeCreated;
  @override
  final String? typeName;
  @override
  final BuiltList<String>? initVars;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TypeRecord([void Function(TypeRecordBuilder)? updates]) =>
      (new TypeRecordBuilder()..update(updates))._build();

  _$TypeRecord._(
      {this.owner,
      this.usersAssigned,
      this.description,
      this.lastEdited,
      this.timeCreated,
      this.typeName,
      this.initVars,
      this.ffRef})
      : super._();

  @override
  TypeRecord rebuild(void Function(TypeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeRecordBuilder toBuilder() => new TypeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeRecord &&
        owner == other.owner &&
        usersAssigned == other.usersAssigned &&
        description == other.description &&
        lastEdited == other.lastEdited &&
        timeCreated == other.timeCreated &&
        typeName == other.typeName &&
        initVars == other.initVars &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, owner.hashCode);
    _$hash = $jc(_$hash, usersAssigned.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, lastEdited.hashCode);
    _$hash = $jc(_$hash, timeCreated.hashCode);
    _$hash = $jc(_$hash, typeName.hashCode);
    _$hash = $jc(_$hash, initVars.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TypeRecord')
          ..add('owner', owner)
          ..add('usersAssigned', usersAssigned)
          ..add('description', description)
          ..add('lastEdited', lastEdited)
          ..add('timeCreated', timeCreated)
          ..add('typeName', typeName)
          ..add('initVars', initVars)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TypeRecordBuilder implements Builder<TypeRecord, TypeRecordBuilder> {
  _$TypeRecord? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  ListBuilder<DocumentReference<Object?>>? _usersAssigned;
  ListBuilder<DocumentReference<Object?>> get usersAssigned =>
      _$this._usersAssigned ??= new ListBuilder<DocumentReference<Object?>>();
  set usersAssigned(ListBuilder<DocumentReference<Object?>>? usersAssigned) =>
      _$this._usersAssigned = usersAssigned;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _lastEdited;
  DateTime? get lastEdited => _$this._lastEdited;
  set lastEdited(DateTime? lastEdited) => _$this._lastEdited = lastEdited;

  DateTime? _timeCreated;
  DateTime? get timeCreated => _$this._timeCreated;
  set timeCreated(DateTime? timeCreated) => _$this._timeCreated = timeCreated;

  String? _typeName;
  String? get typeName => _$this._typeName;
  set typeName(String? typeName) => _$this._typeName = typeName;

  ListBuilder<String>? _initVars;
  ListBuilder<String> get initVars =>
      _$this._initVars ??= new ListBuilder<String>();
  set initVars(ListBuilder<String>? initVars) => _$this._initVars = initVars;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TypeRecordBuilder() {
    TypeRecord._initializeBuilder(this);
  }

  TypeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _usersAssigned = $v.usersAssigned?.toBuilder();
      _description = $v.description;
      _lastEdited = $v.lastEdited;
      _timeCreated = $v.timeCreated;
      _typeName = $v.typeName;
      _initVars = $v.initVars?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeRecord;
  }

  @override
  void update(void Function(TypeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TypeRecord build() => _build();

  _$TypeRecord _build() {
    _$TypeRecord _$result;
    try {
      _$result = _$v ??
          new _$TypeRecord._(
              owner: owner,
              usersAssigned: _usersAssigned?.build(),
              description: description,
              lastEdited: lastEdited,
              timeCreated: timeCreated,
              typeName: typeName,
              initVars: _initVars?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersAssigned';
        _usersAssigned?.build();

        _$failedField = 'initVars';
        _initVars?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TypeRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
