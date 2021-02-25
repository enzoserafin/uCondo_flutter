import 'package:rxdart/rxdart.dart';

class GenericStream<T> {
  final controller = BehaviorSubject<T>();

  get stream => controller.stream;
  get value => controller.value;
  get listen => controller.listen;

  Stream<T> Function(Duration) get debounceTime => controller.debounceTime;

  void add(T object) {
    if (!controller.isClosed) {
      controller.add(object);
    }
  }

  void addError(Object error) {
    if (!controller.isClosed) {
      controller.addError(error);
    }
  }

  void close() {
    controller.close();
  }
}

class BooleanStream extends GenericStream<bool> {}