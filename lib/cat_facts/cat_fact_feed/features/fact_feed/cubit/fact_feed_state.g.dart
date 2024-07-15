// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_feed_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FactFeedStateCWProxy {
  FactFeedState isLoading(bool? isLoading);

  FactFeedState catFeedsResponse(CatFeedsResponse? catFeedsResponse);

  FactFeedState timerText(String? timerText);

  FactFeedState failedWithoutAlertMessage(String? failedWithoutAlertMessage);

  FactFeedState dataResponse(List<DataResponse>? dataResponse);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FactFeedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FactFeedState(...).copyWith(id: 12, name: "My name")
  /// ````
  FactFeedState call({
    bool? isLoading,
    CatFeedsResponse? catFeedsResponse,
    String? timerText,
    String? failedWithoutAlertMessage,
    List<DataResponse>? dataResponse,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFactFeedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFactFeedState.copyWith.fieldName(...)`
class _$FactFeedStateCWProxyImpl implements _$FactFeedStateCWProxy {
  const _$FactFeedStateCWProxyImpl(this._value);

  final FactFeedState _value;

  @override
  FactFeedState isLoading(bool? isLoading) => this(isLoading: isLoading);

  @override
  FactFeedState catFeedsResponse(CatFeedsResponse? catFeedsResponse) =>
      this(catFeedsResponse: catFeedsResponse);

  @override
  FactFeedState timerText(String? timerText) => this(timerText: timerText);

  @override
  FactFeedState failedWithoutAlertMessage(String? failedWithoutAlertMessage) =>
      this(failedWithoutAlertMessage: failedWithoutAlertMessage);

  @override
  FactFeedState dataResponse(List<DataResponse>? dataResponse) =>
      this(dataResponse: dataResponse);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FactFeedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FactFeedState(...).copyWith(id: 12, name: "My name")
  /// ````
  FactFeedState call({
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? catFeedsResponse = const $CopyWithPlaceholder(),
    Object? timerText = const $CopyWithPlaceholder(),
    Object? failedWithoutAlertMessage = const $CopyWithPlaceholder(),
    Object? dataResponse = const $CopyWithPlaceholder(),
  }) {
    return FactFeedState(
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool?,
      catFeedsResponse: catFeedsResponse == const $CopyWithPlaceholder()
          ? _value.catFeedsResponse
          // ignore: cast_nullable_to_non_nullable
          : catFeedsResponse as CatFeedsResponse?,
      timerText: timerText == const $CopyWithPlaceholder()
          ? _value.timerText
          // ignore: cast_nullable_to_non_nullable
          : timerText as String?,
      failedWithoutAlertMessage:
          failedWithoutAlertMessage == const $CopyWithPlaceholder()
              ? _value.failedWithoutAlertMessage
              // ignore: cast_nullable_to_non_nullable
              : failedWithoutAlertMessage as String?,
      dataResponse: dataResponse == const $CopyWithPlaceholder()
          ? _value.dataResponse
          // ignore: cast_nullable_to_non_nullable
          : dataResponse as List<DataResponse>?,
    );
  }
}

extension $FactFeedStateCopyWith on FactFeedState {
  /// Returns a callable class that can be used as follows: `instanceOfFactFeedState.copyWith(...)` or like so:`instanceOfFactFeedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FactFeedStateCWProxy get copyWith => _$FactFeedStateCWProxyImpl(this);
}
