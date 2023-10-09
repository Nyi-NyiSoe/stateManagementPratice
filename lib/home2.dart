import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWordProvider = Provider((ref) => 'helloWorld');

class HomePage2 extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends ConsumerState<HomePage2> {
  @override
  void initState() {
     final helloWorld = ref.read(helloWordProvider);
    print(helloWorld);
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    final helloWorld = ref.watch(helloWordProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('River pod')),
      body: Text(helloWorld),
    ));
  }
}
