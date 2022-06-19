// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_name_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductNameRecord> _$productNameRecordSerializer =
    new _$ProductNameRecordSerializer();

class _$ProductNameRecordSerializer
    implements StructuredSerializer<ProductNameRecord> {
  @override
  final Iterable<Type> types = const [ProductNameRecord, _$ProductNameRecord];
  @override
  final String wireName = 'ProductNameRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductNameRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.productName;
    if (value != null) {
      result
        ..add('productName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productImage;
    if (value != null) {
      result
        ..add('productImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productColor;
    if (value != null) {
      result
        ..add('productColor')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productDefaulTemp;
    if (value != null) {
      result
        ..add('productDefaulTemp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productMileage;
    if (value != null) {
      result
        ..add('productMileage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productLocation;
    if (value != null) {
      result
        ..add('productLocation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.productUser;
    if (value != null) {
      result
        ..add('productUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.productPayment;
    if (value != null) {
      result
        ..add('productPayment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  ProductNameRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductNameRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'productName':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productImage':
          result.productImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productColor':
          result.productColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productDefaulTemp':
          result.productDefaulTemp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productMileage':
          result.productMileage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'productLocation':
          result.productLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'productUser':
          result.productUser = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'productPayment':
          result.productPayment = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$ProductNameRecord extends ProductNameRecord {
  @override
  final String productName;
  @override
  final String productImage;
  @override
  final String productColor;
  @override
  final String productDefaulTemp;
  @override
  final String productMileage;
  @override
  final LatLng productLocation;
  @override
  final DocumentReference<Object> productUser;
  @override
  final DocumentReference<Object> productPayment;
  @override
  final DocumentReference<Object> reference;

  factory _$ProductNameRecord(
          [void Function(ProductNameRecordBuilder) updates]) =>
      (new ProductNameRecordBuilder()..update(updates)).build();

  _$ProductNameRecord._(
      {this.productName,
      this.productImage,
      this.productColor,
      this.productDefaulTemp,
      this.productMileage,
      this.productLocation,
      this.productUser,
      this.productPayment,
      this.reference})
      : super._();

  @override
  ProductNameRecord rebuild(void Function(ProductNameRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductNameRecordBuilder toBuilder() =>
      new ProductNameRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductNameRecord &&
        productName == other.productName &&
        productImage == other.productImage &&
        productColor == other.productColor &&
        productDefaulTemp == other.productDefaulTemp &&
        productMileage == other.productMileage &&
        productLocation == other.productLocation &&
        productUser == other.productUser &&
        productPayment == other.productPayment &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, productName.hashCode),
                                    productImage.hashCode),
                                productColor.hashCode),
                            productDefaulTemp.hashCode),
                        productMileage.hashCode),
                    productLocation.hashCode),
                productUser.hashCode),
            productPayment.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductNameRecord')
          ..add('productName', productName)
          ..add('productImage', productImage)
          ..add('productColor', productColor)
          ..add('productDefaulTemp', productDefaulTemp)
          ..add('productMileage', productMileage)
          ..add('productLocation', productLocation)
          ..add('productUser', productUser)
          ..add('productPayment', productPayment)
          ..add('reference', reference))
        .toString();
  }
}

class ProductNameRecordBuilder
    implements Builder<ProductNameRecord, ProductNameRecordBuilder> {
  _$ProductNameRecord _$v;

  String _productName;
  String get productName => _$this._productName;
  set productName(String productName) => _$this._productName = productName;

  String _productImage;
  String get productImage => _$this._productImage;
  set productImage(String productImage) => _$this._productImage = productImage;

  String _productColor;
  String get productColor => _$this._productColor;
  set productColor(String productColor) => _$this._productColor = productColor;

  String _productDefaulTemp;
  String get productDefaulTemp => _$this._productDefaulTemp;
  set productDefaulTemp(String productDefaulTemp) =>
      _$this._productDefaulTemp = productDefaulTemp;

  String _productMileage;
  String get productMileage => _$this._productMileage;
  set productMileage(String productMileage) =>
      _$this._productMileage = productMileage;

  LatLng _productLocation;
  LatLng get productLocation => _$this._productLocation;
  set productLocation(LatLng productLocation) =>
      _$this._productLocation = productLocation;

  DocumentReference<Object> _productUser;
  DocumentReference<Object> get productUser => _$this._productUser;
  set productUser(DocumentReference<Object> productUser) =>
      _$this._productUser = productUser;

  DocumentReference<Object> _productPayment;
  DocumentReference<Object> get productPayment => _$this._productPayment;
  set productPayment(DocumentReference<Object> productPayment) =>
      _$this._productPayment = productPayment;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProductNameRecordBuilder() {
    ProductNameRecord._initializeBuilder(this);
  }

  ProductNameRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _productName = $v.productName;
      _productImage = $v.productImage;
      _productColor = $v.productColor;
      _productDefaulTemp = $v.productDefaulTemp;
      _productMileage = $v.productMileage;
      _productLocation = $v.productLocation;
      _productUser = $v.productUser;
      _productPayment = $v.productPayment;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductNameRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductNameRecord;
  }

  @override
  void update(void Function(ProductNameRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductNameRecord build() {
    final _$result = _$v ??
        new _$ProductNameRecord._(
            productName: productName,
            productImage: productImage,
            productColor: productColor,
            productDefaulTemp: productDefaulTemp,
            productMileage: productMileage,
            productLocation: productLocation,
            productUser: productUser,
            productPayment: productPayment,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
