import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider((ref) => Counter(ref));

class Counter extends StateNotifier<int> {
  Counter(this.ref): super(0);

  final Ref ref;

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}