import 'package:flutter/material.dart';

class GetColorPage extends StatefulWidget {
  @override
  _GetColorPageState createState() => _GetColorPageState();
}

class _GetColorPageState extends State<GetColorPage> {
  int _red = 0;
  int _green = 0;
  int _blue = 0;

  // Helper function to create a color from the RGB values
  Color _getColorFromValues() {
    return Color.fromARGB(255, _red, _green, _blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Color'),
      ),
      body: Column(
        children: <Widget>[
          Slider(
            value: _red.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            label: 'Red $_red',
            onChanged: (double value) {
              setState(() {
                _red = value.toInt();
              });
            },
          ),
          Slider(
            value: _green.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            label: 'Green $_green',
            onChanged: (double value) {
              setState(() {
                _green = value.toInt();
              });
            },
          ),
          Slider(
            value: _blue.toDouble(),
            min: 0,
            max: 255,
            divisions: 255,
            label: 'Blue $_blue',
            onChanged: (double value) {
              setState(() {
                _blue = value.toInt();
              });
            },
          ),
          // Display the currently selected color
          Container(
            height: 100,
            width: 100,
            color: _getColorFromValues(),
          ),
          ElevatedButton(
            onPressed: () {
              // When the button is pressed, close the screen and return the current color
              Navigator.pop(context, _getColorFromValues());
            },
            child: Text('Select Color'),
          ),
        ],
      ),
    );
  }
}
