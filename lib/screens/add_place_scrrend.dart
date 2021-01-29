import 'package:flutter/material.dart';
import 'package:greatplacesapp/providers/great_places.dart';
import 'package:greatplacesapp/widget/image_input.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController _titleController = TextEditingController();
  File _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new Place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Title'),
                            controller: _titleController,
                          ),
                          SizedBox(height: 10),
                          Container(),
                          ImageInput(_selectImage),
                        ],
                      )))),
          RaisedButton.icon(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              elevation: 0,
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              color: Theme.of(context).accentColor,
              label: Text("Add places"))
        ],
      ),
    );
  }
}
