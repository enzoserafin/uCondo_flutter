import 'package:ucondo_flutter/utils/stream/generic_stream.dart';

class ButtonState {
  bool loading = false;
  bool enabled = false;
}

class ButtonStream extends GenericStream<ButtonState> {
  final state = ButtonState();

  setLoading(b) {
    state.loading = b;
    add(state);
  }

  setEnabled(b) {
    state.enabled = b;
    add(state);
  }
}