// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GroupsRecord> _$groupsRecordSerializer =
    new _$GroupsRecordSerializer();

class _$GroupsRecordSerializer implements StructuredSerializer<GroupsRecord> {
  @override
  final Iterable<Type> types = const [GroupsRecord, _$GroupsRecord];
  @override
  final String wireName = 'GroupsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, GroupsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.groupName;
    if (value != null) {
      result
        ..add('groupName')
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
  GroupsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GroupsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'groupName':
          result.groupName = serializers.deserialize(value,
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

class _$GroupsRecord extends GroupsRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? users;
  @override
  final String? groupName;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$GroupsRecord([void Function(GroupsRecordBuilder)? updates]) =>
      (new GroupsRecordBuilder()..update(updates))._build();

  _$GroupsRecord._({this.users, this.groupName, this.ffRef}) : super._();

  @override
  GroupsRecord rebuild(void Function(GroupsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupsRecordBuilder toBuilder() => new GroupsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GroupsRecord &&
        users == other.users &&
        groupName == other.groupName &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, users.hashCode), groupName.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GroupsRecord')
          ..add('users', users)
          ..add('groupName', groupName)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class GroupsRecordBuilder
    implements Builder<GroupsRecord, GroupsRecordBuilder> {
  _$GroupsRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _users;
  ListBuilder<DocumentReference<Object?>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object?>>();
  set users(ListBuilder<DocumentReference<Object?>>? users) =>
      _$this._users = users;

  String? _groupName;
  String? get groupName => _$this._groupName;
  set groupName(String? groupName) => _$this._groupName = groupName;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  GroupsRecordBuilder() {
    GroupsRecord._initializeBuilder(this);
  }

  GroupsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _groupName = $v.groupName;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GroupsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GroupsRecord;
  }

  @override
  void update(void Function(GroupsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GroupsRecord build() => _build();

  _$GroupsRecord _build() {
    _$GroupsRecord _$result;
    try {
      _$result = _$v ??
          new _$GroupsRecord._(
              users: _users?.build(), groupName: groupName, ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GroupsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
