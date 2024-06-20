import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/services/api_service.dart';

final authProvider = Provider<ApiService>((ref) => ApiService());

final authStateProvider = StateProvider<bool>((ref) => false);
