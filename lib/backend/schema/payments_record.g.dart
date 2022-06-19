// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentsRecord> _$paymentsRecordSerializer =
    new _$PaymentsRecordSerializer();

class _$PaymentsRecordSerializer
    implements StructuredSerializer<PaymentsRecord> {
  @override
  final Iterable<Type> types = const [PaymentsRecord, _$PaymentsRecord];
  @override
  final String wireName = 'PaymentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PaymentsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.paymentUser;
    if (value != null) {
      result
        ..add('paymentUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.paymentProduct;
    if (value != null) {
      result
        ..add('paymentProduct')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.paymentDate;
    if (value != null) {
      result
        ..add('paymentDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.paymentAmount;
    if (value != null) {
      result
        ..add('paymentAmount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.paymentStatus;
    if (value != null) {
      result
        ..add('paymentStatus')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  PaymentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaymentsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'paymentUser':
          result.paymentUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'paymentProduct':
          result.paymentProduct = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'paymentDate':
          result.paymentDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'paymentAmount':
          result.paymentAmount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentStatus':
          result.paymentStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$PaymentsRecord extends PaymentsRecord {
  @override
  final DocumentReference<Object> paymentUser;
  @override
  final DocumentReference<Object> paymentProduct;
  @override
  final DateTime paymentDate;
  @override
  final String paymentAmount;
  @override
  final String paymentStatus;
  @override
  final DocumentReference<Object> reference;

  factory _$PaymentsRecord([void Function(PaymentsRecordBuilder) updates]) =>
      (new PaymentsRecordBuilder()..update(updates)).build();

  _$PaymentsRecord._(
      {this.paymentUser,
      this.paymentProduct,
      this.paymentDate,
      this.paymentAmount,
      this.paymentStatus,
      this.reference})
      : super._();

  @override
  PaymentsRecord rebuild(void Function(PaymentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentsRecordBuilder toBuilder() =>
      new PaymentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentsRecord &&
        paymentUser == other.paymentUser &&
        paymentProduct == other.paymentProduct &&
        paymentDate == other.paymentDate &&
        paymentAmount == other.paymentAmount &&
        paymentStatus == other.paymentStatus &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, paymentUser.hashCode), paymentProduct.hashCode),
                    paymentDate.hashCode),
                paymentAmount.hashCode),
            paymentStatus.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PaymentsRecord')
          ..add('paymentUser', paymentUser)
          ..add('paymentProduct', paymentProduct)
          ..add('paymentDate', paymentDate)
          ..add('paymentAmount', paymentAmount)
          ..add('paymentStatus', paymentStatus)
          ..add('reference', reference))
        .toString();
  }
}

class PaymentsRecordBuilder
    implements Builder<PaymentsRecord, PaymentsRecordBuilder> {
  _$PaymentsRecord _$v;

  DocumentReference<Object> _paymentUser;
  DocumentReference<Object> get paymentUser => _$this._paymentUser;
  set paymentUser(DocumentReference<Object> paymentUser) =>
      _$this._paymentUser = paymentUser;

  DocumentReference<Object> _paymentProduct;
  DocumentReference<Object> get paymentProduct => _$this._paymentProduct;
  set paymentProduct(DocumentReference<Object> paymentProduct) =>
      _$this._paymentProduct = paymentProduct;

  DateTime _paymentDate;
  DateTime get paymentDate => _$this._paymentDate;
  set paymentDate(DateTime paymentDate) => _$this._paymentDate = paymentDate;

  String _paymentAmount;
  String get paymentAmount => _$this._paymentAmount;
  set paymentAmount(String paymentAmount) =>
      _$this._paymentAmount = paymentAmount;

  String _paymentStatus;
  String get paymentStatus => _$this._paymentStatus;
  set paymentStatus(String paymentStatus) =>
      _$this._paymentStatus = paymentStatus;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PaymentsRecordBuilder() {
    PaymentsRecord._initializeBuilder(this);
  }

  PaymentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentUser = $v.paymentUser;
      _paymentProduct = $v.paymentProduct;
      _paymentDate = $v.paymentDate;
      _paymentAmount = $v.paymentAmount;
      _paymentStatus = $v.paymentStatus;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaymentsRecord;
  }

  @override
  void update(void Function(PaymentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PaymentsRecord build() {
    final _$result = _$v ??
        new _$PaymentsRecord._(
            paymentUser: paymentUser,
            paymentProduct: paymentProduct,
            paymentDate: paymentDate,
            paymentAmount: paymentAmount,
            paymentStatus: paymentStatus,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
