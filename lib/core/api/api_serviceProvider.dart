import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});
