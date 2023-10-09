import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) {
  int value = 1;
 
  return value;
});

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final count = ref.watch(counterProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('River Pod testing')),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(count.toString()),
          ElevatedButton(onPressed: () {
          ref.read(counterProvider.notifier).state++;
          }, child: Text('Increase'))
        ]),
      ),
    ));
  }
}
