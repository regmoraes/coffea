class State<T> {
  final T? _data;
  final bool isLoading;
  final Exception? error;

  State(this._data, this.isLoading, this.error);

  T get data => _data!;

  bool get hasError => error != null;

  bool get hasData => data != null;
}
