import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/count.dart';
import 'count.dart';
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: GetBuilder<Count>(builder: (controller){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
              width: 100,
              height: 50,
              child: Card(
                child: Center(
                    child: Text(
                  controller.sum.toString(),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ),
           ElevatedButton(onPressed: (){
            controller.result(controller.count1, controller.count2);
                    }, child: Text('Add')),
        ],
      );
      })
    ));
  }
}
