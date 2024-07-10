class ServerResponse<T, S> {
  const ServerResponse({
    this.data,
    this.error,
    this.revision,
  });

  final T? data;
  final S? error;
  final int? revision;

  bool get isError => error != null;
  bool get isSuccess => !isError;
}
