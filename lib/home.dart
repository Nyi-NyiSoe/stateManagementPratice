import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/result.dart';
import 'count.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('State Management'),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultPage();
                }));
              }, icon: Icon(Icons.arrow_right))
            ],
          ),
          body: GetBuilder<Count>(
            init: Count(),
            builder: (_) {
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
                              child: Text('count1 = '+
                            _.count1.toString(),
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
                              child: Text('count2 = '+
                             _.count2.toString(),
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
                              child: Text('Result = '+
                             _.sum.toString(),
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      _.icrement();
                    }, child: Text('Increase')),
                    
                  ]);
            },
          )),
    );
  }
}
