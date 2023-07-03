import 'package:flutter/material.dart';
import 'contactClass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactList(),
    );
  }
}

class ContactList extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('Mahamud Hasan', 'mahamud@gmail.com', '01316188019'),
    Contact('Mehedi Hasan', 'mehedi@gmail.com', '01632547854'),
    Contact('Md Shuvo', 'shuvo@gmail.com', '0196584214'),
  ];

  ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
          );
        },
      ),
    );
  }

  void _showContactDetails(context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Contact Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Name: ${contact.name}'),
                const SizedBox(height: 7.0),
                Text('Email: ${contact.email}'),
                const SizedBox(height: 7.0),
                Text('Phone Number: ${contact.phone}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
