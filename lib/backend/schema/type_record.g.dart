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
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, owner.hashCode), usersAssigned.hashCode),
                        description.hashCode),
                    lastEdited.hashCode),
                timeCreated.hashCode),
            typeName.hashCode),
        ffRef.hashCode));
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
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersAssigned';
        _usersAssigned?.build();
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
