abstract class RemoteConfigEntity {
  final String _serviceAccountKey;

  const RemoteConfigEntity({
    required String serviceAccountKey,
  }) : _serviceAccountKey = serviceAccountKey;

  String get serviceAccountKey => _serviceAccountKey;
}
