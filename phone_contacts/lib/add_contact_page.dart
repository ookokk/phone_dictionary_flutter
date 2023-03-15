import 'package:flutter/material.dart';

import 'package:phone_contacts/model/contact.dart';

class AddContactPage extends StatelessWidget {
  final Contact? contact;

  const AddContactPage({Key? key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Contact.contacts.add(Contact(name: "Test", phoneNumber: "0555 555 55 55"));
    return Scaffold(
      body: SingleChildScrollView(child: AddContactForm()),
      appBar: AppBar(
        title: Text('Add New Contact'),
      ),
    );
  }
}

class AddContactForm extends StatefulWidget {
  @override
  State<AddContactForm> createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String? name;
    String? phoneNumber;

    return Column(
      children: [
        Image.asset(
          "assets/image/person.jpg",
          fit: BoxFit.fill,
          width: 130,
        ),
        ElevatedButton(
            onPressed: null,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 30,
              color: Colors.white,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      name = value;
                    },
                    decoration: InputDecoration(hintText: "Contact Name"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Name required";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      phoneNumber = value;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "Phone Number"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Number required";
                      }
                    },
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Contact.contacts
                          .add(Contact(name: name!, phoneNumber: phoneNumber!));

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        "$name has been saved",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      )));
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.yellow),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
