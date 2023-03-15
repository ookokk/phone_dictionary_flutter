import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'add_contact_page.dart';
import 'model/contact.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);
  static List<Contact> contacts = Contact.contacts;

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Widget build(BuildContext context) {
    Contact.contacts
        .sort((Contact a, Contact b) => a.name[0].compareTo(b.name[0]));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddContactPage()));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Phone Directory'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: ContactPage.contacts.length,
          itemBuilder: (BuildContext context, int index) {
            Contact contact = ContactPage.contacts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddContactPage(
                              contact: contact,
                            )));
              },
              child: Dismissible(
                key: Key(contact.name),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Colors.redAccent,
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.black54,
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    Contact.contacts.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      action: SnackBarAction(
                        onPressed: () {
                          setState(() {
                            Contact.contacts.add(contact);
                          });
                        },
                        label: "UNDO",
                      ),
                      content: Text(
                        "${contact.name} has been deleted",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/image/person.jpg"),
                    child: Icon(
                      Icons.contacts,
                      size: 30,
                    ),
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.phoneNumber),
                  trailing: IconButton(
                    icon: Icon(Icons.phone),
                    onPressed: () async => _callContact(contact.phoneNumber),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _callContact(String phoneNumber) async {
    String tel = "tel:$phoneNumber";
    if (await canLaunchUrlString(tel)) {
      await launchUrlString(tel);
    }
  }
}
