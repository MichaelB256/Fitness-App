import 'package:flutter/material.dart';

class SocialPage extends StatefulWidget {
  @override
  _SocialPageState createState() => _SocialPageState();
}

class _SocialPageState extends State<SocialPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<Map<String, String>> _contactsList = [];

  Future<void> _addContact() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter details', style: TextStyle(fontSize: 24.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(hintText: 'Phone Number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(fontSize: 24.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add', style: TextStyle(fontSize: 24.0)),
              onPressed: () {
                setState(() {
                  _contactsList.add({
                    'name': _nameController.text,
                    'email': _emailController.text,
                    'phone': _phoneController.text,
                  });
                  _nameController.clear();
                  _emailController.clear();
                  _phoneController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToContactDetails(Map<String, String> contact) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ContactDetailsPage(contact: contact)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: _contactsList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please add a contact.',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addContact,
                    color: Color(0xff212435),
                    iconSize: 48,
                  ),
                ],
              ),
            )
          : Column(
              children: [
                SizedBox(height: 50),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    TextField(
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Social Page',
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _addContact,
                        color: Color(0xff212435),
                        iconSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _contactsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () =>
                              _navigateToContactDetails(_contactsList[index]),
                          child: Text(
                            _contactsList[index]['name']!,
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class ContactDetailsPage extends StatelessWidget {
  final Map<String, String> contact;

  ContactDetailsPage({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact['name']!, style: TextStyle(fontSize: 24.0)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${contact['name']}', style: TextStyle(fontSize: 24.0)),
            Text('Email: ${contact['email']}',
                style: TextStyle(fontSize: 24.0)),
            Text('Phone: ${contact['phone']}',
                style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}
