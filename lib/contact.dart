import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/contact_provider.dart';

class ContactPage extends ConsumerWidget {
  ContactPage({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactProvider);
    final contactsMethod =
        ref.read(contactProvider.notifier); // Using watch instead of read

    // Build a Text widget for each contact's name

    // Combine the Text widgets into a Column

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              dialogWidget(context, () {
                contactsMethod.add(nameController.text, phoneController.text,
                    emailController.text);
                nameController.clear();
                phoneController.clear();
                emailController.clear();
                Navigator.pop(context);
              });
            },
            child: Text('+'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: ((context) {
                                  return AlertDialog(
                                    title: Text('Delete contact?'),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel')),
                                          TextButton(
                                              onPressed: () {
                                                contactsMethod
                                                    .deleteContact(index);

                                                Navigator.pop(context);
                                              },
                                              child: Text('Confirm'))
                                        ],
                                      )
                                    ],
                                  );
                                }));
                          },
                          onLongPress: () {
                            dialogWidget(context, () {
                              contactsMethod.updateContact(
                                  index,
                                  nameController.text,
                                  phoneController.text,
                                  emailController.text);
                              nameController.clear();
                              phoneController.clear();
                              emailController.clear();
                              Navigator.pop(context);
                            });
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Text(contacts[index].name),
                                Text(contacts[index].phoneNum),
                                Text(contacts[index].email),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              )
            ],
          )),
    );
  }

  Future<dynamic> dialogWidget(
      BuildContext context, void Function()? onPressed) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text('Add contact'),
            actions: [
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Name'),
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(hintText: 'Phone Number'),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  ElevatedButton(
                      onPressed: onPressed, child: Text('Add Contact'))
                ],
              )
            ],
          );
        }));
  }

  // @override
  // void dispose(){
  //   nameController.dispose();
  //    phoneController.dispose();
  //     nameController.dispose();
  // }
}
