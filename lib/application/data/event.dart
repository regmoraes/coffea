enum DataState { success, notAsked, loading, failure }

abstract class Event<T> {}

class NotAsked<T> implements Event<T> {}

class Loading<T> implements Event<T> {}

class Success<T> implements Event<T> {
  final T data;

  Success(this.data);
}

class SuccessOrNull<T> implements Event<T> {
  final T? data;

  SuccessOrNull(this.data);
}

class Failure<T> implements Event<T> {
  final Exception exception;

  Failure({required this.exception});
}
