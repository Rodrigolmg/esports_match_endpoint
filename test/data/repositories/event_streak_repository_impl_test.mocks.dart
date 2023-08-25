// Mocks generated by Mockito 5.4.2 from annotations
// in esports_match_endpoint/test/data/repositories/event_streak_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:esports_match_endpoint/core/core.dart' as _i5;
import 'package:esports_match_endpoint/data/datasources/datasource.dart' as _i2;
import 'package:esports_match_endpoint/data/model/model.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [EventStreakDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventStreakDataSource extends _i1.Mock
    implements _i2.EventStreakDataSource {
  @override
  _i3.Future<_i4.EventStreakModel?> getEventStreaks(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEventStreaks,
          [id],
        ),
        returnValue: _i3.Future<_i4.EventStreakModel?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.EventStreakModel?>.value(),
      ) as _i3.Future<_i4.EventStreakModel?>);
}

/// A class which mocks [EventStreakLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockEventStreakLocalDataSource extends _i1.Mock
    implements _i2.EventStreakLocalDataSource {
  @override
  _i3.Future<_i4.EventStreakModel?> getLastEventStreak() => (super.noSuchMethod(
        Invocation.method(
          #getLastEventStreak,
          [],
        ),
        returnValue: _i3.Future<_i4.EventStreakModel?>.value(),
        returnValueForMissingStub: _i3.Future<_i4.EventStreakModel?>.value(),
      ) as _i3.Future<_i4.EventStreakModel?>);
  @override
  _i3.Future<void> cacheEventStreak(_i4.EventStreakModel? eventStreakModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheEventStreak,
          [eventStreakModel],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i5.NetworkInfo {
  @override
  _i3.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i3.Future<bool>.value(false),
        returnValueForMissingStub: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);
}
