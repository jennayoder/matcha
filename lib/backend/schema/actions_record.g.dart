// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActionsRecord> _$actionsRecordSerializer =
    new _$ActionsRecordSerializer();

class _$ActionsRecordSerializer implements StructuredSerializer<ActionsRecord> {
  @override
  final Iterable<Type> types = const [ActionsRecord, _$ActionsRecord];
  @override
  final String wireName = 'ActionsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ActionsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.checks;
    if (value != null) {
      result
        ..add('checks')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.commands;
    if (value != null) {
      result
        ..add('commands')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.actionName;
    if (value != null) {
      result
        ..add('actionName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.groups;
    if (value != null) {
      result
        ..add('groups')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  ActionsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActionsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'checks':
          result.checks.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'commands':
          result.commands.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'actionName':
          result.actionName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'groups':
          result.groups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$ActionsRecord extends ActionsRecord {
  @override
  final BuiltList<String>? checks;
  @override
  final BuiltList<String>? commands;
  @override
  final String? actionName;
  @override
  final BuiltList<DocumentReference<Object?>>? groups;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActionsRecord([void Function(ActionsRecordBuilder)? updates]) =>
      (new ActionsRecordBuilder()..update(updates))._build();

  _$ActionsRecord._(
      {this.checks, this.commands, this.actionName, this.groups, this.ffRef})
      : super._();

  @override
  ActionsRecord rebuild(void Function(ActionsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActionsRecordBuilder toBuilder() => new ActionsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActionsRecord &&
        checks == other.checks &&
        commands == other.commands &&
        actionName == other.actionName &&
        groups == other.groups &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, checks.hashCode), commands.hashCode),
                actionName.hashCode),
            groups.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActionsRecord')
          ..add('checks', checks)
          ..add('commands', commands)
          ..add('actionName', actionName)
          ..add('groups', groups)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ActionsRecordBuilder
    implements Builder<ActionsRecord, ActionsRecordBuilder> {
  _$ActionsRecord? _$v;

  ListBuilder<String>? _checks;
  ListBuilder<String> get checks =>
      _$this._checks ??= new ListBuilder<String>();
  set checks(ListBuilder<String>? checks) => _$this._checks = checks;

  ListBuilder<String>? _commands;
  ListBuilder<String> get commands =>
      _$this._commands ??= new ListBuilder<String>();
  set commands(ListBuilder<String>? commands) => _$this._commands = commands;

  String? _actionName;
  String? get actionName => _$this._actionName;
  set actionName(String? actionName) => _$this._actionName = actionName;

  ListBuilder<DocumentReference<Object?>>? _groups;
  ListBuilder<DocumentReference<Object?>> get groups =>
      _$this._groups ??= new ListBuilder<DocumentReference<Object?>>();
  set groups(ListBuilder<DocumentReference<Object?>>? groups) =>
      _$this._groups = groups;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ActionsRecordBuilder() {
    ActionsRecord._initializeBuilder(this);
  }

  ActionsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _checks = $v.checks?.toBuilder();
      _commands = $v.commands?.toBuilder();
      _actionName = $v.actionName;
      _groups = $v.groups?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActionsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActionsRecord;
  }

  @override
  void update(void Function(ActionsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActionsRecord build() => _build();

  _$ActionsRecord _build() {
    _$ActionsRecord _$result;
    try {
      _$result = _$v ??
          new _$ActionsRecord._(
              checks: _checks?.build(),
              commands: _commands?.build(),
              actionName: actionName,
              groups: _groups?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'checks';
        _checks?.build();
        _$failedField = 'commands';
        _commands?.build();

        _$failedField = 'groups';
        _groups?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ActionsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
