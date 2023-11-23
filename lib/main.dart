import 'package:flutter/material.dart';
import 'get_name_page.dart';
import 'get_color_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Final Assignment Mobile App III',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _familyMember = '';
  String _name = '';
  Color _backgroundColor = Colors.white; // Default background color

  Future<void> _navigateAndGetName(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetNamePage()),
    );

    if (result != null) {
      setState(() {
        _familyMember = result['familyMember'].toString().split('.').last;
        _name = result['name'];
      });
    }
  }

  Future<void> _navigateAndGetColor(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GetColorPage()),
    );

    if (result != null && result is Color) {
      setState(() {
        _backgroundColor = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _navigateAndGetName(context),
              child: Text('Get Name'),
            ),
            if (_familyMember.isNotEmpty && _name.isNotEmpty) ...[
              Container(
                color:
                    _backgroundColor, // Set the background color to the selected color
                padding: EdgeInsets.all(8.0),
                child: Text(
                    'Selected family member: $_familyMember\nEntered name: $_name'),
              ),
            ],
            ElevatedButton(
              onPressed: () => _navigateAndGetColor(context),
              child: Text('Get Color'),
            ),
          ],
        ),
      ),
    );
  }
}
