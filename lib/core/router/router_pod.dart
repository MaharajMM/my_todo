import 'package:my_todo/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This global variable used for global working on ui elements where
/// may be context is not present
final navigatorKey = GlobalKey<NavigatorState>();

/// This provider used for storing router
/// and can be acessed by reading it using ProviderRef/WidgetRef
final autorouterProvider = Provider.autoDispose<AppRouter>(
  (ref) => AppRouter(),
  name: 'autorouterProvider',
);
