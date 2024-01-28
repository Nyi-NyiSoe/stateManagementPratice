import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/contact_model.dart';

class ContactProvider extends StateNotifier<List<ContactModel>> {
  ContactProvider(List<ContactModel> initialState) : super(initialState ?? []);

  // Add this method to initialize with some initial data
  // void initializeWithInitialData() {
  //   add('John Doe', '123-456-7890', 'john@example.com');
  //   add('Jane Smith', '987-654-3210', 'jane@example.com');
  //   // Add more contacts as needed
  // }

  void add(String name, String phoneNum, String email) {
    var person = ContactModel(name: name, phoneNum: phoneNum, email: email);
    state = [...state, person];
  }

  void deleteContact(int index) {
    state = List.from(state)..removeAt(index);
  }
  void updateContact(int index,String name,String phoneNum,String email){
    ContactModel newContact = ContactModel(name: name, phoneNum: phoneNum, email: email);
    List<ContactModel> updateContactList = List.from(state);
    updateContactList[index] = newContact;
    state = updateContactList;
  }
}

final contactProvider = StateNotifierProvider<ContactProvider, List<ContactModel>>(
  (ref) {
    final contactProvider = ContactProvider([]);
    // contactProvider.initializeWithInitialData(); // Initialize with initial data
    return contactProvider;
  },
);
