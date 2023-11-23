import 'package:flutter/material.dart';

enum FamilyMember { mother, father, cat, dog }

class GetNamePage extends StatefulWidget {
  @override
  _GetNamePageState createState() => _GetNamePageState();
}

class _GetNamePageState extends State<GetNamePage> {
  FamilyMember? _selectedFamilyMember;
  String _enteredName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Family Member and Set Name'),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Mother'),
            leading: Radio<FamilyMember>(
              value: FamilyMember.mother,
              groupValue: _selectedFamilyMember,
              onChanged: (FamilyMember? value) {
                setState(() {
                  _selectedFamilyMember = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Father'),
            leading: Radio<FamilyMember>(
              value: FamilyMember.father,
              groupValue: _selectedFamilyMember,
              onChanged: (FamilyMember? value) {
                setState(() {
                  _selectedFamilyMember = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Cat'),
            leading: Radio<FamilyMember>(
              value: FamilyMember.cat,
              groupValue: _selectedFamilyMember,
              onChanged: (FamilyMember? value) {
                setState(() {
                  _selectedFamilyMember = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Dog'),
            leading: Radio<FamilyMember>(
              value: FamilyMember.dog,
              groupValue: _selectedFamilyMember,
              onChanged: (FamilyMember? value) {
                setState(() {
                  _selectedFamilyMember = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter name',
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {
                  _enteredName = value;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: _selectedFamilyMember == null || _enteredName.isEmpty
                ? null
                : () {
                    // Use the Navigator to pop and pass the data back to the MainPage
                    Navigator.pop(context, {
                      'familyMember': _selectedFamilyMember,
                      'name': _enteredName,
                    });
                  },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
