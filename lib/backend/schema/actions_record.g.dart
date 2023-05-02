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
    final result = <Object?>[
      'commands',
      serializers.serialize(object.commands,
          specifiedType: const FullType(CommandsStruct)),
    ];
    Object? value;
    value = object.checks;
    if (value != null) {
      result
        ..add('checks')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    // value = object.commands;
    // if (value != null) {
    //   result
    //     ..add('commands')
    //     ..add(serializers.serialize(value,
    //         specifiedType:
    //             const FullType(BuiltList, const [const FullType(String)])));
    // }
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
    value = object.emails;
    if (value != null) {
      result
        ..add('emails')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
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
        case 'commands':
          result.commands.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CommandsStruct))!
              as CommandsStruct);
          break;
        case 'emails':
          result.emails.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'message':
          result.message = serializers.deserialize(value,
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

class _$ActionsRecord extends ActionsRecord {
  @override
  final BuiltList<String>? checks;
  @override
  final String? actionName;
  @override
  final BuiltList<DocumentReference<Object?>>? groups;
  @override
  final CommandsStruct commands;
  @override
  final BuiltList<String>? emails;
  @override
  final String? message;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActionsRecord([void Function(ActionsRecordBuilder)? updates]) =>
      (new ActionsRecordBuilder()..update(updates))._build();

  _$ActionsRecord._(
      {this.checks,
      this.actionName,
      this.groups,
      required this.commands,
      this.emails,
      this.message,
      this.ffRef})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        commands, r'ActionsRecord', 'commands');
  }

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
        actionName == other.actionName &&
        groups == other.groups &&
        commands == other.commands &&
        emails == other.emails &&
        message == other.message &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, checks.hashCode);
    _$hash = $jc(_$hash, actionName.hashCode);
    _$hash = $jc(_$hash, groups.hashCode);
    _$hash = $jc(_$hash, commands.hashCode);
    _$hash = $jc(_$hash, emails.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActionsRecord')
          ..add('checks', checks)
          ..add('actionName', actionName)
          ..add('groups', groups)
          ..add('commands', commands)
          ..add('emails', emails)
          ..add('message', message)
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


  ListBuilder<String>? _emails;
  ListBuilder<String> get emails =>
      _$this._emails ??= new ListBuilder<String>();

  set emails(ListBuilder<String>? emails) => _$this._emails = emails;


  String? _actionName;
  String? get actionName => _$this._actionName;
  set actionName(String? actionName) => _$this._actionName = actionName;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<DocumentReference<Object?>>? _groups;
  ListBuilder<DocumentReference<Object?>> get groups =>
      _$this._groups ??= new ListBuilder<DocumentReference<Object?>>();
  set groups(ListBuilder<DocumentReference<Object?>>? groups) =>
      _$this._groups = groups;

  CommandsStructBuilder? _commands;
  CommandsStructBuilder get commands =>
      _$this._commands ??= new CommandsStructBuilder();
  set commands(CommandsStructBuilder? commands) => _$this._commands = commands;

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
      _actionName = $v.actionName;
      _message = $v.message;
      _groups = $v.groups?.toBuilder();
      _commands = $v.commands.toBuilder();
      _emails = $v.emails?.toBuilder();

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
              actionName: actionName,
              message: message,
              groups: _groups?.build(),
              commands: commands.build(),
              emails: _emails?.build(),

              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'checks';
        _checks?.build();
        _$failedField = 'groups';
        _groups?.build();
        _$failedField = 'commands';
        commands.build();
        _$failedField = 'emails';
        _emails?.build();
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

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
