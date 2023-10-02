import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/count.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Result Page'),
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Count.to.result(Count.to.count1,Count.to.count2);
                          print(Count.to.sum);
                        },
                        child: Obx(() => Text(Count.to.sum.toString())))),
                  
                ],
              )));
  }
}
