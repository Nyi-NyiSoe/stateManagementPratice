import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/contact.dart';
import 'package:statemanagement/json_provider.dart';
import 'package:statemanagement/profile_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonData = ref.watch(jsonProvider);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ContactPage();
            }));

          }, child: Text('Contact'))
        ],
      ),
      body: Column(
        children: [
          jsonData.when(data: (data) {
            return Expanded(
                child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.5,
                        crossAxisCount: 2),
                    itemBuilder: ((context, index) {
                      return ProfileCard(
                          name: data[index].name,
                          url: data[index].url,
                          age: data[index].age.toString(),
                          student: data[index].student,
                          grades: data[index].grades,
                          city: data[index].address['city'],
                          zipCode: data[index].address['zipCode']);
                    })));
          }, error: (error, stackTrace) {
            print(error.toString());
            return Text(error.toString());
          }, loading: () {
            return const CircularProgressIndicator();
          })
        ],
      ),
    ));
  }
}
