import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/result.dart';
import 'count.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    Get.put(Count());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('State Management'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage();
                    }));
                  },
                  icon: Icon(Icons.arrow_right))
            ],
          ),
          body: Column(
            children: [
              GetBuilder<Count>(
                id: 'id1',
                init: Count(),
                builder: (value) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.black),
                            width: 150,
                            height: 50,
                            child: Card(
                              child: Center(
                                  child: Text(
                                'count1 = ' + value.count1.toString(),
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.amber),
                            width: 150,
                            height: 50,
                            child: Card(
                              child: Center(
                                  child: Text(
                                'count2 = ' + value.count2.toString(),
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.amber),
                            width: 150,
                            height: 50,
                            child: Card(
                              child: Center(
                                  child: Text(
                                'Result = ' + value.sum.toString(),
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              value.icrement();
                            },
                            child: Text('Increase')),
                            
                      ]);
                },
              ),
             GetBuilder<Count>(
              id: 'id2',
              builder: (_){
              return Text(_.sum.toString());
             }),
              ElevatedButton(
                            onPressed: () {
                              Count.to.result(Count.to.count1, Count.to.count2);
                            },
                            child: Text('add')),
            ],
          )),
    );
  }
}
