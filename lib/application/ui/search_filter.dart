//TODO Create Search Bloc with debouncing;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

typedef Where<T> = bool Function(String, T);

class SearchFilter<T> extends Bloc<String?, List<T>> {
  List<T> _original = List.empty();
  List<T> _filtered = List.empty();

  SearchFilter(Where<T> where) : super(List.empty()) {
    on<String?>(
      (String? searchTerm, emit) {
        if (searchTerm?.isNotEmpty == true) {
          _filtered = _original
              .where((element) => where(searchTerm!, element))
              .toList();
          emit(_filtered);
        } else {
          emit(_original);
        }
      },
      transformer: debounce(const Duration(milliseconds: 200)),
    );
  }

  set original(List<T> value) {
    _original = value;
    add(null);
  }

  //Debounce query requests
  EventTransformer<E> debounce<E>(Duration duration) {
    return (events, mapper) => events.debounce(duration).switchMap(mapper);
  }
}
