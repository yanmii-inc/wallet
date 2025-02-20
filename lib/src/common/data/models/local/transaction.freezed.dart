// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String get date => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'wallet_id')
  int? get walletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'dest_wallet_id')
  int? get destWalletId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeIfNull: false)
  Wallet? get wallet => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeIfNull: false)
  Wallet? get destWallet => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeIfNull: false)
  Category? get category => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String date,
      int amount,
      String title,
      String type,
      int? id,
      String? description,
      @JsonKey(name: 'wallet_id') int? walletId,
      @JsonKey(name: 'dest_wallet_id') int? destWalletId,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(includeToJson: false, includeIfNull: false) Wallet? wallet,
      @JsonKey(includeToJson: false, includeIfNull: false) Wallet? destWallet,
      @JsonKey(includeToJson: false, includeIfNull: false) Category? category});

  $WalletCopyWith<$Res>? get wallet;
  $WalletCopyWith<$Res>? get destWallet;
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? title = null,
    Object? type = null,
    Object? id = freezed,
    Object? description = freezed,
    Object? walletId = freezed,
    Object? destWalletId = freezed,
    Object? categoryId = freezed,
    Object? wallet = freezed,
    Object? destWallet = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      destWalletId: freezed == destWalletId
          ? _value.destWalletId
          : destWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      destWallet: freezed == destWallet
          ? _value.destWallet
          : destWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ) as $Val);
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get destWallet {
    if (_value.destWallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.destWallet!, (value) {
      return _then(_value.copyWith(destWallet: value) as $Val);
    });
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int amount,
      String title,
      String type,
      int? id,
      String? description,
      @JsonKey(name: 'wallet_id') int? walletId,
      @JsonKey(name: 'dest_wallet_id') int? destWalletId,
      @JsonKey(name: 'category_id') int? categoryId,
      @JsonKey(includeToJson: false, includeIfNull: false) Wallet? wallet,
      @JsonKey(includeToJson: false, includeIfNull: false) Wallet? destWallet,
      @JsonKey(includeToJson: false, includeIfNull: false) Category? category});

  @override
  $WalletCopyWith<$Res>? get wallet;
  @override
  $WalletCopyWith<$Res>? get destWallet;
  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? amount = null,
    Object? title = null,
    Object? type = null,
    Object? id = freezed,
    Object? description = freezed,
    Object? walletId = freezed,
    Object? destWalletId = freezed,
    Object? categoryId = freezed,
    Object? wallet = freezed,
    Object? destWallet = freezed,
    Object? category = freezed,
  }) {
    return _then(_$TransactionImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      destWalletId: freezed == destWalletId
          ? _value.destWalletId
          : destWalletId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      destWallet: freezed == destWallet
          ? _value.destWallet
          : destWallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {required this.date,
      required this.amount,
      required this.title,
      this.type = 'expense',
      this.id = null,
      this.description = null,
      @JsonKey(name: 'wallet_id') this.walletId = null,
      @JsonKey(name: 'dest_wallet_id') this.destWalletId = null,
      @JsonKey(name: 'category_id') this.categoryId = null,
      @JsonKey(includeToJson: false, includeIfNull: false) this.wallet = null,
      @JsonKey(includeToJson: false, includeIfNull: false)
      this.destWallet = null,
      @JsonKey(includeToJson: false, includeIfNull: false)
      this.category = null});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String date;
  @override
  final int amount;
  @override
  final String title;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? description;
  @override
  @JsonKey(name: 'wallet_id')
  final int? walletId;
  @override
  @JsonKey(name: 'dest_wallet_id')
  final int? destWalletId;
  @override
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  final Wallet? wallet;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  final Wallet? destWallet;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  final Category? category;

  @override
  String toString() {
    return 'Transaction(date: $date, amount: $amount, title: $title, type: $type, id: $id, description: $description, walletId: $walletId, destWalletId: $destWalletId, categoryId: $categoryId, wallet: $wallet, destWallet: $destWallet, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.destWalletId, destWalletId) ||
                other.destWalletId == destWalletId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.destWallet, destWallet) ||
                other.destWallet == destWallet) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      amount,
      title,
      type,
      id,
      description,
      walletId,
      destWalletId,
      categoryId,
      wallet,
      destWallet,
      category);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final String date,
      required final int amount,
      required final String title,
      final String type,
      final int? id,
      final String? description,
      @JsonKey(name: 'wallet_id') final int? walletId,
      @JsonKey(name: 'dest_wallet_id') final int? destWalletId,
      @JsonKey(name: 'category_id') final int? categoryId,
      @JsonKey(includeToJson: false, includeIfNull: false) final Wallet? wallet,
      @JsonKey(includeToJson: false, includeIfNull: false)
      final Wallet? destWallet,
      @JsonKey(includeToJson: false, includeIfNull: false)
      final Category? category}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String get date;
  @override
  int get amount;
  @override
  String get title;
  @override
  String get type;
  @override
  int? get id;
  @override
  String? get description;
  @override
  @JsonKey(name: 'wallet_id')
  int? get walletId;
  @override
  @JsonKey(name: 'dest_wallet_id')
  int? get destWalletId;
  @override
  @JsonKey(name: 'category_id')
  int? get categoryId;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  Wallet? get wallet;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  Wallet? get destWallet;
  @override
  @JsonKey(includeToJson: false, includeIfNull: false)
  Category? get category;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
