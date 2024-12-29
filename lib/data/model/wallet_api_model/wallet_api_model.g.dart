// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletApiModelImpl _$$WalletApiModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletApiModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      walletData: json['data'] == null
          ? null
          : WalletData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WalletApiModelImplToJson(
        _$WalletApiModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.walletData,
    };

_$WalletDataImpl _$$WalletDataImplFromJson(Map<String, dynamic> json) =>
    _$WalletDataImpl(
      wallet: (json['wallet'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WalletDataImplToJson(_$WalletDataImpl instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
    };
